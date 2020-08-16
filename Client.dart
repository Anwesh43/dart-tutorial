import 'dart:io';
import 'dart:convert';
Future main() async {
    String url = 'https://reqres.in/api/users';
    Uri uri = Uri.parse(url);
    HttpClient client = new HttpClient();
    HttpClientRequest request = await client.openUrl("get", uri);
    HttpClientResponse response = await request.close();
    List<String> data = await utf8.decoder.bind(response).toList();
    print(data);
    client.close();
}