String helloWorld() {
    return "hello";
}

void listDemo() {
    List<int> newList = [for (var i = 0; i < 10; i++) 2 * (i + 1)];
    newList.forEach((a) => print(a));
}

void mapDemo() {
    Map m = <String, int>{};
    m['a'] = 0;
    m['b'] = 1;
    print('a is ${m['a']}');
    print('b is ${m['b']}');
    print('size is ${m.length}');
}

void constDemo() {
  List<int> nums = const [1, 2, 3, 4];
  nums.forEach(print);
  try {
      nums.add(2);
  } catch(e) {
      print("cannot add to immutable list");
      print(e);
  }

}

void namedFunctionDemo({String name, int age}) {
    print("Iam $name and my age is $age");
}

void positionalFunction(String a, String b, [String c]) {
  print('$a to $b');
  if (c != null) {
    print('then to $c');
  }
}

void setLiteralDemo() {
    Set demoSet = {'chlorine', 'fluorine', 'neon', 'hydrogen'};
    demoSet.forEach((elem) => print(elem));
    demoSet.add('oxygen');
    demoSet.add('hydrogen');
    print("after adding oxygen and hydrogen");
    demoSet.forEach(print);
    Set citrusFruit = <String>{};
    citrusFruit.add('lemon');
    citrusFruit.add('orange');
    citrusFruit.add('gooseberry');
    Set fruitSet = <String>{};
    fruitSet.add('apple');
    fruitSet.add('banana');
    fruitSet.add('banana');
    fruitSet.addAll(citrusFruit);
    print('list of fruits, total fruits : ${fruitSet.length}');
    fruitSet.forEach((fruit) {
        print(fruit);
    });
}

void main() {
    // var ino;
    // assert(ino == null);
    // double pi = double.parse('3.14');
    // String s1 = '''Stephen William Hawking CH CBE FRS FRSA was an \nEnglish theoretical physicist, cosmologist, and author who \n was director of research at the Centre for Theoretical Cosmology \nat the University of Cambridge at the time of his deat''';
    // print('pi is ${pi}');
    // print(helloWorld());
    // print('multiline string is ${s1}');
    // listDemo();
    // setLiteralDemo();
    // mapDemo();
    //constDemo();

    positionalFunction("April", "May");
    print("passing June");
    positionalFunction("April", "May", "June");
    namedFunctionDemo(age : 28, name : 'Anwesh');
}