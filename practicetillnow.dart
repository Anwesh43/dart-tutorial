int add(int a, int b, [int c]) {
    int sum = a + b;
    if (c != null) {
        sum += c;
    }
    return sum;
}

int operate({int a, int b = 20, int c = 10, Function cb}) {
    return cb(a, b, c);
}

Iterable getFirstNaturalNumbers(int n, int k) sync* {
    int i = k;
    while (i < n) {
        yield i;
        i+=k;
    }
}

Stream<int> getFirstNaturalStram(int n, int k) async* {
    int i = k;
    while (i < n) {
        yield i;
        i += k;
    }

}

Future main() async {
    getFirstNaturalStram(20, 2).listen((i) => print('listening to stream for $i'));
    print('the sum of 10, 20, 30 = ${add(10, 20, 30)}');
    print('the sum of 10, 20 is ${add(10, 20)}');
    print('operation ${operate(a : 6, cb : add)}');
    for (int i in getFirstNaturalNumbers(20, 3)) {
        print('current is $i');
    }
    await for (int i in getFirstNaturalStram(20, 5)) {
        print('current in stream $i');
    }
}


