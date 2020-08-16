import 'dart:io';
import 'dart:convert';
Future main()  async {
    File f = File('config.txt');
    String data = await f.readAsString();
    print(data);
    Stream<List<int>> stream = f.openRead();
    Stream<String> lines = utf8.decoder.bind(stream).transform(LineSplitter());
    Map<String, int> properties = new Map();
    await for (String line in lines) {
        if (line.trim() == "") {
            continue;
        }
        List<String> parts = line.trim().split("=");
        properties[parts[0]] = int.parse(parts[1]);
    }
    StringBuffer sb = new StringBuffer();
    print("{");
    sb.writeln("{");
    properties.forEach((key, value) {
        sb.writeln("  $key: $value,");
    });
    sb.writeln("}");
    String dataToWrite = sb.toString();
    print(dataToWrite);
    File file = File("bb.json");
    IOSink sink = file.openWrite();
    sink.write(dataToWrite);
    await sink.flush();
    await sink.close();
  
}