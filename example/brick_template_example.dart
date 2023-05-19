import 'package:brick_template/brick_template.dart';
import 'package:brick_template/src/templates.dart';
import 'package:reflection_factory/reflection_factory.dart';

part 'brick_template_example.reflection.g.dart';

@EnableReflection()
class Person {
  final String name;
  final int age;
  final String? address;

  Person({
    required this.name,
    required this.age,
    this.address,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'age': age,
        'address': address,
      };
}

void main() {
  ReflectionFactory().registerClassReflection<Person>(Person$reflection.staticInstance);

  final p = Person(name: 'Nico', age: 30);
  final p2 = Person(name: 'Luca', age: 40, address: '123 Main St.');

  final builder = TemplateBuilder(
    mainTemplate: MapTemplate(
      template: '''
Hello {\$name}! You are {\$ age} years old.
{?address}You live @ {\$address}.{?}\n
''',
    ),
  );

  print(builder.generate(p.toMap()));

  print(builder.generate(p2.toMap()));

  final reflectionBuilder = TemplateBuilder(
    mainTemplate: ReflectionTemplate<Person>(
      template: '''
Hello {\$name}! You are {\$ age} years old.{?address}
You live @ {\$address}.
{?}
''',
    ),
  );

  print(reflectionBuilder.generate(p).replaceAll('\n', '_'));

  print(reflectionBuilder.generate(p2).replaceAll('\n', '_'));
}
