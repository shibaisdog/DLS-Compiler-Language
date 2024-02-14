import 'dart:io';
Future<String> read(String file) async {
  File f = File(file);
  return f.readAsStringSync();
}
void write(String file,text) {
  File f = File(file);
  f.writeAsStringSync(text);
}
void directory(String path) {
  Directory newDirectory = Directory(path);
  if (!newDirectory.existsSync()) {newDirectory.createSync(recursive: true);} else {}
}