import 'dart:async';

Future<String> delayedDemo({int n = 1}) async => Future.delayed(Duration(seconds : n), () => 'delayed hello after $n seconds');
Future<String> demo() async =>  'hello';
Future  main() async {
    String k = await demo();
    print("k is $k");
    delayedDemo().then(print);
    String delayedString = await delayedDemo(n : 2);
    print(delayedString);
}