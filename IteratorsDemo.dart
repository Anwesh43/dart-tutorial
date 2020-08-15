Iterable<int> iterateToNaturalNumbers(int n) sync* {
    int i = 1;
    while (i <= n) {
        yield i * 3;
        i++;
    }
}
void main() {
  for (int k in iterateToNaturalNumbers(10)) {
      print("$k");
  }
}