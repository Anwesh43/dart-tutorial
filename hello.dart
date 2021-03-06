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

void functionsWithDefaultValue({bool colored = false,bool bold = false}) {
    if (colored) {
        print("text is colored");
    }
    if (bold) {
        print("text is bold");
    }
    if (!colored && !bold) {
        print("text is neither bold nor colored");
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

void divisionDemo(int a, int b) {
    double d = a / b;
    int di = a ~/ b;
    print("a / b approx = $d and rounded off $di");
}

Function add(int addBy) {
  return (n) => addBy + n; 
}

void nonNullOperatorDemo() {
    int a = 10, b;
    int c = b ?? 40;
    int d = a ?? 100;
    a??=20;
    b??=20;
    print("a is $a, b is $b");
    print("c is $c and d is $d");
}

void cascadeNotationDemo() {
    List<int> list = []
      ..add(1)
      ..add(2)
      ..add(3)
      ..add(4)
      ..add(5)
      ..forEach(print);
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

    // positionalFunction("April", "May");
    // print("passing June");
    // positionalFunction("April", "May", "June");
    // namedFunctionDemo(age : 28, name : 'Anwesh');

    // print("------------------------->");
    // print("neither bold nor colored");
    // functionsWithDefaultValue();
    // print("------------------------->");
    // print("only bold text");
    // functionsWithDefaultValue(bold : true);
    // print("------------------------->");
    // print("only colored text");
    // functionsWithDefaultValue(colored : true);
    // print("------------------------->");
    // print("both colored and bold text");
    // functionsWithDefaultValue(bold : true, colored : true);

    // print('10 + 20 is ${add(10)(20)}');
    // divisionDemo(30,20);
    //nonNullOperatorDemo();
    cascadeNotationDemo();
}