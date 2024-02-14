import 'dart:io';
import 'manager.dart' as mn;
void version(String args) {
  if (
    args == "-v" || 
    args == "--v" ||
    args == "-version" ||
    args == "--version"
  ) {
    print('DLS beta 0.0.2');
    exit(0);
  }
}
void file(String args) {
  if (
    args == "-f" ||
    args == "--f" ||
    args == "-file" ||
    args == "--file"
  ) {
    mn.global.f_l = mn.global.line;
    return;
  }
  if (mn.global.f_l != 0 && mn.global.f_l < mn.global.line) {
    mn.global.file.add(args);
  }
}