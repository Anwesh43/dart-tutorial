import 'dart:convert';
void main() {
    String url = "http://www.google.com?q=Dart";
    Uri uri = Uri.parse(url);
    print(uri);
    print(uri.scheme);
    print(uri.host);
    print(uri.queryParameters);
    uri.queryParameters.forEach((key, value) {print('${key}: ${value}');});
    print(Uri.encodeComponent(url));
    print(Uri.encodeQueryComponent(url));
    List<int> lines = utf8.encode(url);
    lines.forEach(print);
}