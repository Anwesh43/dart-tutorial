String helloWorld() {
    return "hello";
}

void listDemo() {
    List<int> newList = [for (var i = 0; i < 10; i++) 2 * (i + 1)];
    newList.forEach((a) => print(a));
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
    var ino;
    assert(ino == null);
    double pi = double.parse('3.14');
    String s1 = '''Stephen William Hawking CH CBE FRS FRSA was an \nEnglish theoretical physicist, cosmologist, and author who \n was director of research at the Centre for Theoretical Cosmology \nat the University of Cambridge at the time of his deat''';
    print('pi is ${pi}');
    print(helloWorld());
    print('multiline string is ${s1}');
    listDemo();
    setLiteralDemo();
}