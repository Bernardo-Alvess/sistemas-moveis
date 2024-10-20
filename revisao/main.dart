void main() {
  List<Map<String, dynamic>> jsonPersons = [
    {"name": "Bernardo", "age": 21},
    {"name": "Daniel", "age": 19}
  ];

  List<Person> listPersons = List.empty(growable: true);

  for (Map<String, dynamic> person in jsonPersons) {
    listPersons.add(Person.convertJson(person));
  }

  listPersons.forEach(print);
}

class Person {
  final String name;
  final int age;

  const Person({required String this.name, required int this.age});

  factory Person.convertJson(Map<String, dynamic> person) {
    return Person(name: person["name"], age: person["age"]);
  }

  String toString() {
    return "Name ${this.name} - Age: ${this.age}";
  }
}

class Pessoa {
  Pessoa({required String name, required int age});
}
