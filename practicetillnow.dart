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
void main() {
    print('the sum of 10, 20, 30 = ${add(10, 20, 30)}');
    print('the sum of 10, 20 is ${add(10, 20)}');
    print('operation ${operate(a : 6, cb : add)}');
}
