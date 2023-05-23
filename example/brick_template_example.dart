import 'package:brick_template/brick_template.dart';
import 'package:reflection_factory/reflection_factory.dart';

part 'brick_template_example.reflection.g.dart';

@EnableReflection()
class Person {
  final String name;
  final int age;
  final String? address;
  List<Friend>? friends;

  Person({
    required this.name,
    required this.age,
    this.address,
    this.friends,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'age': age,
        'address': address,
        'friends': friends,
      };
}

@EnableReflection()
class Friend {
  final String name;
  final int age;

  Friend({
    required this.name,
    required this.age,
  });
}

void main() {
  ReflectionFactory().registerClassReflection<Person>(Person$reflection.staticInstance);

  final p = Person(
    name: 'Nico',
    age: 30,
  );
  final p2 = Person(name: 'Luca', age: 40, address: '123 Main St', friends: [Friend(name: 'Luigi', age: 21), Friend(name: 'Mario', age: 34)]);

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
{?friends}
Your friends are:
{?friends}
{\$friends}
{?}
{?}
''',
      ),
      childrenTemplates: {
        Friend: ReflectionTemplate<Friend>(
          template: '''
{\$name} is {\$age} years old.
''',
        ),
      });

  print(reflectionBuilder.generate(p));

  print(reflectionBuilder.generate(p2));
}
