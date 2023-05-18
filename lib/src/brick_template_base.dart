abstract class Template<T> {
  abstract String template;

  /// Returns the value of the variable with the given [variableName]
  /// If the variable is not found, throws [FormatException]
  dynamic getVariable(T dataSource, String variableName);

  Brick _generateBrickTree(T dataSource, TemplateBuilder<T> builder) {
    // Root brick
    _BaseBrick root = _BaseBrick(content: template);

    // Match {$variableName}
    final variablePattern = RegExp(r'\{\$([^\}]+)\}');
    // Match {? variableName}
    final dependencyPattern = RegExp(r'\{\?\s*([^\}]+)\}');
    // Match {?}
    final dependencyClosePattern = RegExp(r'\{\?}');

    List<Brick> bricks = [];

    // Create all variable bricks
    bricks.addAll(
      variablePattern.allMatches(template).map(
        (e) {
          final varName = e.group(1)!;
          try {
            return _VariableBrick(e.group(0)!, varName, e.start, e.end - e.start, builder, getVariable(dataSource, varName.trim()));
          } on FormatException {
            throw InvalidVariableNameException(varName, _countLines(e.start, template));
          }
        },
      ),
    );

    // Find all dependecies in the template
    final dependencies = dependencyPattern.allMatches(template).toList();
    // Find all closing conditions in the template
    final dependencyCloseBlocks = dependencyClosePattern.allMatches(template).toList();

    for (final i = dependencies.reversed.iterator; i.moveNext();) {
      final condition = i.current;
      RegExpMatch closeCondition;
      try {
        closeCondition = dependencyCloseBlocks.firstWhere((e) => e.start > condition.end);
      } catch (_) {
        throw Exception(); // TODO
      }
      dependencyCloseBlocks.remove(closeCondition);
      bricks.add(
        _DependencyBrick(
          content: template.substring(condition.start, closeCondition.end),
          startingIndex: condition.start,
          extent: closeCondition.end - condition.start,
          variableName: condition.group(1)!,
          variable: getVariable(dataSource, condition.group(1)!.trim()),
        ),
      );
    }

    // Sort bricks by their starting index
    bricks.sort((a, b) => a.startingIndex - b.startingIndex);

    // Create the brick tree
    _children(root, bricks);

    return root;
  }

  /// [parent] is the brick that will be the parent of the children
  /// [candidates] is the list of bricks that may be children of [parent]
  void _children(_BrickWithChildren parent, List<Brick> candidates) {
    for (int i = 0; i < candidates.length; i++) {
      final brick = candidates[i];

      // If brick starts inside parent, brick is a valid candidate
      if (brick.startingIndex > parent.startingIndex && brick.startingIndex < parent.startingIndex + parent.extent) {
        // If bricks intersects parent, raise exception
        if (brick.startingIndex + brick.extent > parent.startingIndex + parent.extent) {
          throw Exception("Bricks intersects"); // TODO ad hoc exception
        }
        // Remove brick from candidates as it is now a child of parent, decrement i to compensate
        candidates.remove(brick);
        i--;

        // If brick can contain children, call _children recursively
        if (brick is _BrickWithChildren) {
          _children(brick, candidates);
        }
        // Add brick to parent's children
        parent.children.add(brick);
      }
    }
  }

  int _countLines(int index, String template) {
    return template.substring(0, index).split('\n').length;
  }
}

class TemplateBuilder<T> {
  final Template<T> mainTemplate;
  final Set<Template> childrenTemplates;
  late T mainDataSource;

  TemplateBuilder({required this.mainTemplate, this.childrenTemplates = const {}, T? mainDataSource}) {
    if (mainDataSource != null) this.mainDataSource = mainDataSource;
  }

  Template? teplateFor<E>() {
    try {
      return childrenTemplates.firstWhere((element) => element is Template<E>);
    } catch (_) {
      return null;
    }
  }

  String generate() {
    return mainTemplate._generateBrickTree(mainDataSource, this).toText();
  }
}

mixin Brick {
  // Content of this brick
  abstract final String content;
  // Starting index of this brick in the original template
  abstract final int startingIndex;
  // Extent of this brick in the original template
  abstract final int extent;

  // Returns the formatted text of this brick
  String toText();
}

mixin _BrickWithChildren on Brick {
  // Children of this brick
  abstract List<Brick> children;
}

class _BaseBrick implements _BrickWithChildren {
  @override
  final String content;
  @override
  final int startingIndex;
  @override
  final int extent;

  @override
  List<Brick> children;

  _BaseBrick({
    required this.content,
    List<Brick>? children,
  })  : startingIndex = 0,
        extent = content.length,
        children = children ?? [];

  @override
  String toText() {
    if (children.isEmpty) return content;
    final sb = StringBuffer();
    int lastEnd = 0;

    for (final child in children) {
      sb.write(content.substring(lastEnd, child.startingIndex - startingIndex));
      sb.write(child.toText());
      lastEnd = child.startingIndex - startingIndex + child.extent;
    }
    sb.write(content.substring(lastEnd));
    return sb.toString();
  }
}

class _VariableBrick implements Brick {
  @override
  final String content;
  @override
  final int startingIndex;
  @override
  final int extent;

  final TemplateBuilder builder;

  // Name of the variable
  final String variableName;

  // Value of the variable
  dynamic variable;

  _VariableBrick(this.content, this.variableName, this.startingIndex, this.extent, this.builder, [this.variable]);

  @override
  String toText() {
    return variable?.toString() ?? '';
  }
}

class _DependencyBrick extends _BaseBrick {
  @override
  final int startingIndex;
  @override
  final int extent;

  final String variableName;

  dynamic variable;

  _DependencyBrick({
    required String content,
    List<Brick>? children,
    required this.startingIndex,
    required this.extent,
    required this.variableName,
    this.variable,
  }) : super(content: content, children: children);

  @override
  String toText() {
    final start = RegExp(r'}[\s\n]*').firstMatch(content)!.end;
    final end = RegExp(r'[\s\n]*{\?}').allMatches(content).last.start;
    if (variable != null) {
      return super.toText().substring(start, end);
    }
    return '';
  }
}

class InvalidVariableNameException implements Exception {
  final String variableName;
  final int line;

  InvalidVariableNameException(this.variableName, this.line);

  @override
  String toString() {
    return 'Invalid variable "$variableName" on line $line';
  }
}

class InvalidConditionException implements Exception {
  final String condition;
  final int line;
  final String reason;

  InvalidConditionException(this.condition, this.line, this.reason);

  @override
  String toString() {
    return 'Invalid condition "$condition" on line $line: $reason';
  }
}
