import 'dart:io';
import '../pub/process.dart' as proc;
import '../pub/pubspec.dart' as paks;
void version(String args) {
  if (
    args == "-v" || 
    args == "--v" ||
    args == "-version" ||
    args == "--version"
  ) {
    print('DLS-Package 0.0.1');
    exit(0);
  }
}
Future<void> get(String args) async {
  if (
    args == "-g" ||
    args == "--g" ||
    args == "-get" ||
    args == "--get"
  ) {
    await proc.get();
    exit(0);
  }
}
Future<void> init(String args) async {
  if (
    args == "i" ||
    args == "init"
  ) {
    await paks.onload();
    exit(0);
  }
}