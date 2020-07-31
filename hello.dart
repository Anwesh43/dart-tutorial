String helloWorld() {
    return "hello";
}
void main() {
    var ino;
    assert(ino == null);
    double pi = double.parse('3.14');
    String s1 = '''Stephen William Hawking CH CBE FRS FRSA was an \nEnglish theoretical physicist, cosmologist, and author who \n was director of research at the Centre for Theoretical Cosmology \nat the University of Cambridge at the time of his deat''';
    print('pi is ${pi}');
    print(helloWorld());
    print('multiline string is ${s1}');
}