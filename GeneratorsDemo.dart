import "dart:async";
Stream<int> generateEventNaturals(int n) async* {
    int i = 1;
    while (i <= n) {
        yield i * 2;
        i++;
    }
}

Future main()async {
    await for(int i  in generateEventNaturals(10)) {
      print(i);
    }
}