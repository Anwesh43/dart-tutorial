import 'dart:convert';

class Person {
    String name;
    int age;

    Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    Person.fromJson(Map object) {
        this.name = object["name"];
        this.age = object["age"];
    }

    int get doubleOfAge => age * 2;

    @override 
    String toString() => 'My name is $name and age is $age';
}

void jsonDecodeDemo() {
    String jsonStr = '''
        [
            {
              "name" : "A1",
              "age" : 22
            },
            {
              "name" : "A2",
              "age" : 23
            }, 
            {
              "name" : "A3",
              "age" : 25
            }
        ]
    ''';
    Object o = jsonDecode(jsonStr);
    print(o);
    print(o.runtimeType);
    List objects = o as List;
    List<Person> persons = objects.map((Object p) => new Person.fromJson(p)).toList();
    persons.forEach(print);
    persons.map((Person p) => p.doubleOfAge).forEach(print);
}
void main() {
    jsonDecodeDemo();
}

