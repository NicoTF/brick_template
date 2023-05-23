//
// GENERATED CODE - DO NOT MODIFY BY HAND!
// BUILDER: reflection_factory/2.1.2
// BUILD COMMAND: dart run build_runner build
//

// coverage:ignore-file
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_cast
// ignore_for_file: unnecessary_type_check

part of 'brick_template_example.dart';

typedef __TR<T> = TypeReflection<T>;
typedef __TI<T> = TypeInfo<T>;
typedef __PR = ParameterReflection;

mixin __ReflectionMixin {
  static final Version _version = Version.parse('2.1.2');

  Version get reflectionFactoryVersion => _version;

  List<Reflection> siblingsReflection() => _siblingsReflection();
}

// ignore: non_constant_identifier_names
Friend Friend$fromJson(Map<String, Object?> map) =>
    Friend$reflection.staticInstance.fromJson(map);
// ignore: non_constant_identifier_names
Friend Friend$fromJsonEncoded(String jsonEncoded) =>
    Friend$reflection.staticInstance.fromJsonEncoded(jsonEncoded);
// ignore: non_constant_identifier_names
Person Person$fromJson(Map<String, Object?> map) =>
    Person$reflection.staticInstance.fromJson(map);
// ignore: non_constant_identifier_names
Person Person$fromJsonEncoded(String jsonEncoded) =>
    Person$reflection.staticInstance.fromJsonEncoded(jsonEncoded);

class Friend$reflection extends ClassReflection<Friend> with __ReflectionMixin {
  static final Expando<Friend$reflection> _objectReflections = Expando();

  factory Friend$reflection([Friend? object]) {
    if (object == null) return staticInstance;
    return _objectReflections[object] ??= Friend$reflection._(object);
  }

  Friend$reflection._([Friend? object]) : super(Friend, 'Friend', object);

  static bool _registered = false;
  @override
  void register() {
    if (!_registered) {
      _registered = true;
      super.register();
      _registerSiblingsReflection();
    }
  }

  @override
  Version get languageVersion => Version.parse('3.0.0');

  @override
  Friend$reflection withObject([Friend? obj]) =>
      Friend$reflection(obj)..setupInternalsWith(this);

  static Friend$reflection? _withoutObjectInstance;
  @override
  Friend$reflection withoutObjectInstance() => staticInstance;

  static Friend$reflection get staticInstance =>
      _withoutObjectInstance ??= Friend$reflection._();

  @override
  Friend$reflection getStaticInstance() => staticInstance;

  static bool _boot = false;
  static void boot() {
    if (_boot) return;
    _boot = true;
    Friend$reflection.staticInstance;
  }

  @override
  bool get hasDefaultConstructor => false;
  @override
  Friend? createInstanceWithDefaultConstructor() => null;

  @override
  bool get hasEmptyConstructor => false;
  @override
  Friend? createInstanceWithEmptyConstructor() => null;
  @override
  bool get hasNoRequiredArgsConstructor => false;
  @override
  Friend? createInstanceWithNoRequiredArgsConstructor() => null;

  static const List<String> _constructorsNames = const <String>[''];

  @override
  List<String> get constructorsNames => _constructorsNames;

  static final Map<String, ConstructorReflection<Friend>> _constructors =
      <String, ConstructorReflection<Friend>>{};

  @override
  ConstructorReflection<Friend>? constructor(String constructorName) {
    var c = _constructors[constructorName];
    if (c != null) return c;
    c = _constructorImpl(constructorName);
    if (c == null) return null;
    _constructors[constructorName] = c;
    return c;
  }

  ConstructorReflection<Friend>? _constructorImpl(String constructorName) {
    var lc = constructorName.trim().toLowerCase();

    switch (lc) {
      case '':
        return ConstructorReflection<Friend>(
            this,
            Friend,
            '',
            () => ({required String name, required int age}) =>
                Friend(name: name, age: age),
            null,
            null,
            const <String, __PR>{
              'age': __PR(__TR.tInt, 'age', false, true),
              'name': __PR(__TR.tString, 'name', false, true)
            },
            null);
      default:
        return null;
    }
  }

  static const List<Object> _classAnnotations = <Object>[];

  @override
  List<Object> get classAnnotations => _classAnnotations;

  static const List<Type> _supperTypes = const <Type>[];

  @override
  List<Type> get supperTypes => _supperTypes;

  @override
  bool get hasMethodToJson => false;

  @override
  Object? callMethodToJson([Friend? obj]) => null;

  static const List<String> _fieldsNames = const <String>['age', 'name'];

  @override
  List<String> get fieldsNames => _fieldsNames;

  static final Map<String, FieldReflection<Friend, dynamic>> _fieldsNoObject =
      <String, FieldReflection<Friend, dynamic>>{};

  final Map<String, FieldReflection<Friend, dynamic>> _fieldsObject =
      <String, FieldReflection<Friend, dynamic>>{};

  @override
  FieldReflection<Friend, T>? field<T>(String fieldName, [Friend? obj]) {
    if (obj == null) {
      if (object != null) {
        return _fieldObjectImpl<T>(fieldName);
      } else {
        return _fieldNoObjectImpl<T>(fieldName);
      }
    } else if (identical(obj, object)) {
      return _fieldObjectImpl<T>(fieldName);
    }
    return _fieldNoObjectImpl<T>(fieldName)?.withObject(obj);
  }

  FieldReflection<Friend, T>? _fieldNoObjectImpl<T>(String fieldName) {
    final f = _fieldsNoObject[fieldName];
    if (f != null) {
      return f as FieldReflection<Friend, T>;
    }
    final f2 = _fieldImpl(fieldName, null);
    if (f2 == null) return null;
    _fieldsNoObject[fieldName] = f2;
    return f2 as FieldReflection<Friend, T>;
  }

  FieldReflection<Friend, T>? _fieldObjectImpl<T>(String fieldName) {
    final f = _fieldsObject[fieldName];
    if (f != null) {
      return f as FieldReflection<Friend, T>;
    }
    var f2 = _fieldNoObjectImpl<T>(fieldName);
    if (f2 == null) return null;
    f2 = f2.withObject(object!);
    _fieldsObject[fieldName] = f2;
    return f2;
  }

  FieldReflection<Friend, dynamic>? _fieldImpl(String fieldName, Friend? obj) {
    obj ??= object;

    var lc = fieldName.trim().toLowerCase();

    switch (lc) {
      case 'name':
        return FieldReflection<Friend, String>(
          this,
          Friend,
          __TR.tString,
          'name',
          false,
          (o) => () => o!.name,
          null,
          obj,
          false,
          true,
        );
      case 'age':
        return FieldReflection<Friend, int>(
          this,
          Friend,
          __TR.tInt,
          'age',
          false,
          (o) => () => o!.age,
          null,
          obj,
          false,
          true,
        );
      default:
        return null;
    }
  }

  static const List<String> _staticFieldsNames = const <String>[];

  @override
  List<String> get staticFieldsNames => _staticFieldsNames;

  @override
  FieldReflection<Friend, T>? staticField<T>(String fieldName) => null;

  static const List<String> _methodsNames = const <String>[];

  @override
  List<String> get methodsNames => _methodsNames;

  @override
  MethodReflection<Friend, R>? method<R>(String methodName, [Friend? obj]) =>
      null;
  static const List<String> _staticMethodsNames = const <String>[];

  @override
  List<String> get staticMethodsNames => _staticMethodsNames;

  @override
  MethodReflection<Friend, R>? staticMethod<R>(String methodName) => null;
}

class Person$reflection extends ClassReflection<Person> with __ReflectionMixin {
  static final Expando<Person$reflection> _objectReflections = Expando();

  factory Person$reflection([Person? object]) {
    if (object == null) return staticInstance;
    return _objectReflections[object] ??= Person$reflection._(object);
  }

  Person$reflection._([Person? object]) : super(Person, 'Person', object);

  static bool _registered = false;
  @override
  void register() {
    if (!_registered) {
      _registered = true;
      super.register();
      _registerSiblingsReflection();
    }
  }

  @override
  Version get languageVersion => Version.parse('3.0.0');

  @override
  Person$reflection withObject([Person? obj]) =>
      Person$reflection(obj)..setupInternalsWith(this);

  static Person$reflection? _withoutObjectInstance;
  @override
  Person$reflection withoutObjectInstance() => staticInstance;

  static Person$reflection get staticInstance =>
      _withoutObjectInstance ??= Person$reflection._();

  @override
  Person$reflection getStaticInstance() => staticInstance;

  static bool _boot = false;
  static void boot() {
    if (_boot) return;
    _boot = true;
    Person$reflection.staticInstance;
  }

  @override
  bool get hasDefaultConstructor => false;
  @override
  Person? createInstanceWithDefaultConstructor() => null;

  @override
  bool get hasEmptyConstructor => false;
  @override
  Person? createInstanceWithEmptyConstructor() => null;
  @override
  bool get hasNoRequiredArgsConstructor => false;
  @override
  Person? createInstanceWithNoRequiredArgsConstructor() => null;

  static const List<String> _constructorsNames = const <String>[''];

  @override
  List<String> get constructorsNames => _constructorsNames;

  static final Map<String, ConstructorReflection<Person>> _constructors =
      <String, ConstructorReflection<Person>>{};

  @override
  ConstructorReflection<Person>? constructor(String constructorName) {
    var c = _constructors[constructorName];
    if (c != null) return c;
    c = _constructorImpl(constructorName);
    if (c == null) return null;
    _constructors[constructorName] = c;
    return c;
  }

  ConstructorReflection<Person>? _constructorImpl(String constructorName) {
    var lc = constructorName.trim().toLowerCase();

    switch (lc) {
      case '':
        return ConstructorReflection<Person>(
            this,
            Person,
            '',
            () => (
                    {required String name,
                    required int age,
                    String? address,
                    List<Friend>? friends}) =>
                Person(
                    name: name, age: age, address: address, friends: friends),
            null,
            null,
            const <String, __PR>{
              'address': __PR(__TR.tString, 'address', true, false),
              'age': __PR(__TR.tInt, 'age', false, true),
              'friends': __PR(
                  __TR<List<Friend>>(List, <__TR>[__TR<Friend>(Friend)]),
                  'friends',
                  true,
                  false),
              'name': __PR(__TR.tString, 'name', false, true)
            },
            null);
      default:
        return null;
    }
  }

  static const List<Object> _classAnnotations = <Object>[];

  @override
  List<Object> get classAnnotations => _classAnnotations;

  static const List<Type> _supperTypes = const <Type>[];

  @override
  List<Type> get supperTypes => _supperTypes;

  @override
  bool get hasMethodToJson => false;

  @override
  Object? callMethodToJson([Person? obj]) => null;

  static const List<String> _fieldsNames = const <String>[
    'address',
    'age',
    'friends',
    'name'
  ];

  @override
  List<String> get fieldsNames => _fieldsNames;

  static final Map<String, FieldReflection<Person, dynamic>> _fieldsNoObject =
      <String, FieldReflection<Person, dynamic>>{};

  final Map<String, FieldReflection<Person, dynamic>> _fieldsObject =
      <String, FieldReflection<Person, dynamic>>{};

  @override
  FieldReflection<Person, T>? field<T>(String fieldName, [Person? obj]) {
    if (obj == null) {
      if (object != null) {
        return _fieldObjectImpl<T>(fieldName);
      } else {
        return _fieldNoObjectImpl<T>(fieldName);
      }
    } else if (identical(obj, object)) {
      return _fieldObjectImpl<T>(fieldName);
    }
    return _fieldNoObjectImpl<T>(fieldName)?.withObject(obj);
  }

  FieldReflection<Person, T>? _fieldNoObjectImpl<T>(String fieldName) {
    final f = _fieldsNoObject[fieldName];
    if (f != null) {
      return f as FieldReflection<Person, T>;
    }
    final f2 = _fieldImpl(fieldName, null);
    if (f2 == null) return null;
    _fieldsNoObject[fieldName] = f2;
    return f2 as FieldReflection<Person, T>;
  }

  FieldReflection<Person, T>? _fieldObjectImpl<T>(String fieldName) {
    final f = _fieldsObject[fieldName];
    if (f != null) {
      return f as FieldReflection<Person, T>;
    }
    var f2 = _fieldNoObjectImpl<T>(fieldName);
    if (f2 == null) return null;
    f2 = f2.withObject(object!);
    _fieldsObject[fieldName] = f2;
    return f2;
  }

  FieldReflection<Person, dynamic>? _fieldImpl(String fieldName, Person? obj) {
    obj ??= object;

    var lc = fieldName.trim().toLowerCase();

    switch (lc) {
      case 'name':
        return FieldReflection<Person, String>(
          this,
          Person,
          __TR.tString,
          'name',
          false,
          (o) => () => o!.name,
          null,
          obj,
          false,
          true,
        );
      case 'age':
        return FieldReflection<Person, int>(
          this,
          Person,
          __TR.tInt,
          'age',
          false,
          (o) => () => o!.age,
          null,
          obj,
          false,
          true,
        );
      case 'address':
        return FieldReflection<Person, String?>(
          this,
          Person,
          __TR.tString,
          'address',
          true,
          (o) => () => o!.address,
          null,
          obj,
          false,
          true,
        );
      case 'friends':
        return FieldReflection<Person, List<Friend>?>(
          this,
          Person,
          __TR<List<Friend>>(List, <__TR>[__TR<Friend>(Friend)]),
          'friends',
          true,
          (o) => () => o!.friends,
          (o) => (v) => o!.friends = v,
          obj,
          false,
          false,
        );
      default:
        return null;
    }
  }

  static const List<String> _staticFieldsNames = const <String>[];

  @override
  List<String> get staticFieldsNames => _staticFieldsNames;

  @override
  FieldReflection<Person, T>? staticField<T>(String fieldName) => null;

  static const List<String> _methodsNames = const <String>['toMap'];

  @override
  List<String> get methodsNames => _methodsNames;

  static final Map<String, MethodReflection<Person, dynamic>> _methodsNoObject =
      <String, MethodReflection<Person, dynamic>>{};

  final Map<String, MethodReflection<Person, dynamic>> _methodsObject =
      <String, MethodReflection<Person, dynamic>>{};

  @override
  MethodReflection<Person, R>? method<R>(String methodName, [Person? obj]) {
    if (obj == null) {
      if (object != null) {
        return _methodObjectImpl<R>(methodName);
      } else {
        return _methodNoObjectImpl<R>(methodName);
      }
    } else if (identical(obj, object)) {
      return _methodObjectImpl<R>(methodName);
    }
    return _methodNoObjectImpl<R>(methodName)?.withObject(obj);
  }

  MethodReflection<Person, R>? _methodNoObjectImpl<R>(String methodName) {
    final m = _methodsNoObject[methodName];
    if (m != null) {
      return m as MethodReflection<Person, R>;
    }
    final m2 = _methodImpl(methodName, null);
    if (m2 == null) return null;
    _methodsNoObject[methodName] = m2;
    return m2 as MethodReflection<Person, R>;
  }

  MethodReflection<Person, R>? _methodObjectImpl<R>(String methodName) {
    final m = _methodsObject[methodName];
    if (m != null) {
      return m as MethodReflection<Person, R>;
    }
    var m2 = _methodNoObjectImpl<R>(methodName);
    if (m2 == null) return null;
    m2 = m2.withObject(object!);
    _methodsObject[methodName] = m2;
    return m2;
  }

  MethodReflection<Person, dynamic>? _methodImpl(
      String methodName, Person? obj) {
    obj ??= object;

    var lc = methodName.trim().toLowerCase();

    switch (lc) {
      case 'tomap':
        return MethodReflection<Person, Map<String, dynamic>>(
            this,
            Person,
            'toMap',
            __TR.tMapStringDynamic,
            false,
            (o) => o!.toMap,
            obj,
            false,
            null,
            null,
            null,
            null);
      default:
        return null;
    }
  }

  static const List<String> _staticMethodsNames = const <String>[];

  @override
  List<String> get staticMethodsNames => _staticMethodsNames;

  @override
  MethodReflection<Person, R>? staticMethod<R>(String methodName) => null;
}

extension Friend$reflectionExtension on Friend {
  /// Returns a [ClassReflection] for type [Friend]. (Generated by [ReflectionFactory])
  ClassReflection<Friend> get reflection => Friend$reflection(this);

  /// Returns a JSON for type [Friend]. (Generated by [ReflectionFactory])
  Object? toJson({bool duplicatedEntitiesAsID = false}) =>
      reflection.toJson(null, null, duplicatedEntitiesAsID);

  /// Returns a JSON [Map] for type [Friend]. (Generated by [ReflectionFactory])
  Map<String, dynamic>? toJsonMap({bool duplicatedEntitiesAsID = false}) =>
      reflection.toJsonMap(duplicatedEntitiesAsID: duplicatedEntitiesAsID);

  /// Returns an encoded JSON [String] for type [Friend]. (Generated by [ReflectionFactory])
  String toJsonEncoded(
          {bool pretty = false, bool duplicatedEntitiesAsID = false}) =>
      reflection.toJsonEncoded(
          pretty: pretty, duplicatedEntitiesAsID: duplicatedEntitiesAsID);

  /// Returns a JSON for type [Friend] using the class fields. (Generated by [ReflectionFactory])
  Object? toJsonFromFields({bool duplicatedEntitiesAsID = false}) => reflection
      .toJsonFromFields(duplicatedEntitiesAsID: duplicatedEntitiesAsID);
}

extension Person$reflectionExtension on Person {
  /// Returns a [ClassReflection] for type [Person]. (Generated by [ReflectionFactory])
  ClassReflection<Person> get reflection => Person$reflection(this);

  /// Returns a JSON for type [Person]. (Generated by [ReflectionFactory])
  Object? toJson({bool duplicatedEntitiesAsID = false}) =>
      reflection.toJson(null, null, duplicatedEntitiesAsID);

  /// Returns a JSON [Map] for type [Person]. (Generated by [ReflectionFactory])
  Map<String, dynamic>? toJsonMap({bool duplicatedEntitiesAsID = false}) =>
      reflection.toJsonMap(duplicatedEntitiesAsID: duplicatedEntitiesAsID);

  /// Returns an encoded JSON [String] for type [Person]. (Generated by [ReflectionFactory])
  String toJsonEncoded(
          {bool pretty = false, bool duplicatedEntitiesAsID = false}) =>
      reflection.toJsonEncoded(
          pretty: pretty, duplicatedEntitiesAsID: duplicatedEntitiesAsID);

  /// Returns a JSON for type [Person] using the class fields. (Generated by [ReflectionFactory])
  Object? toJsonFromFields({bool duplicatedEntitiesAsID = false}) => reflection
      .toJsonFromFields(duplicatedEntitiesAsID: duplicatedEntitiesAsID);
}

List<Reflection> _listSiblingsReflection() => <Reflection>[
      Person$reflection(),
      Friend$reflection(),
    ];

List<Reflection>? _siblingsReflectionList;
List<Reflection> _siblingsReflection() => _siblingsReflectionList ??=
    List<Reflection>.unmodifiable(_listSiblingsReflection());

bool _registerSiblingsReflectionCalled = false;
void _registerSiblingsReflection() {
  if (_registerSiblingsReflectionCalled) return;
  _registerSiblingsReflectionCalled = true;
  var length = _listSiblingsReflection().length;
  assert(length > 0);
}
