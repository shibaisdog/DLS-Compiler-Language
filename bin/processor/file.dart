import 'dart:io';
read(String file) {
  var f = File(file);
  return f.readAsStringSync();
}
write(String file,text) {
  var f = File(file);
  f.writeAsStringSync(text);
}
directory(String path) {
  final newDirectory = Directory(path);
  if (!newDirectory.existsSync()) {newDirectory.createSync(recursive: true);} else {}
}