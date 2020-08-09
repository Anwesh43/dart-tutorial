import 'dart:async';

Future<String> demo() async =>  'hello';
Future  main() async {
    String k = await demo();
    print("k is $k");
}