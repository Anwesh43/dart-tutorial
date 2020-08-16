import 'dart:io';

Future main() async {
    Directory directory = Directory(".");
    try {
        await for (FileSystemEntity entity in directory.list()) {
            print(entity.path);
        }
    } catch(e) {
        print(e);
    }
}