import 'package:reflection_factory/reflection_factory.dart';

import 'brick_template_base.dart';

class MapTemplate extends Template<Map<String, dynamic>> {
  @override
  String template;

  MapTemplate({
    required this.template,
  });

  @override
  getVariable(Map<String, dynamic> source, String variableName) {
    if (source.containsKey(variableName)) {
      return source[variableName];
    }
    throw FormatException('Variable $variableName not found');
  }
}

/// A template that uses reflection to get the variables from the data source
/// Classes must be annotated with @EnableReflection()
/// [ReflectionFactory] must be initialized using registerEnumReflection and/or registerClassReflection
class ReflectionTemplate<T> extends Template<T> {
  @override
  String template;
  late final ClassReflection<T> _reflection;

  ReflectionTemplate({
    required this.template,
  }) {
    final reflection = ReflectionFactory().getRegisterClassReflection<T>(T);

    if (reflection == null) throw Exception('${T.toString()} is not reflectable');
    _reflection = reflection;
  }

  @override
  getVariable(T dataSource, String variableName) {
    if (_reflection.fieldsNames.contains(variableName)) {
      return _reflection.getField(variableName, dataSource);
    }
    throw FormatException('Variable $variableName not found');
  }
}

class ProxyVariablesTemplate extends Template {
  @override
  String template;

  final Template child;

  Map<String, dynamic> variables;

  ProxyVariablesTemplate({
    required this.child,
    this.variables = const {},
  }) : template = child.template;

  @override
  getVariable(dataSource, String variableName) {
    if (variables.containsKey(variableName)) {
      return variables[variableName];
    }
    return child.getVariable(dataSource, variableName);
  }
}
