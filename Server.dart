import 'dart:io';

void processRequest(HttpRequest request) {
    HttpResponse response = request.response;
    response
    ..headers.contentType = ContentType('text', 'plain')
    ..statusCode = HttpStatus.ok
    ..write('hello world')
    ..close();

}
Future main() async {
    HttpServer server = await HttpServer.bind("localhost", 8900);
    print("started in listening in 8900");
    await for (HttpRequest request in server) {
        print("received request $request");
        processRequest(request);
    }
}