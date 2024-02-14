import 'dart:io';
import 'manager.dart' as mn;
version(String args) {
  if (
    args == "-v" || 
    args == "--v" ||
    args == "-version" ||
    args == "--version"
  ) {
    print('DLS beta 0.0.1');
    exit(0);
  }
}
file(String args) {
  if (
    args == "-f" ||
    args == "--f" ||
    args == "-file" ||
    args == "--file"
  ) {
    return mn.global.f_l = mn.global.line;
  }
  if (mn.global.f_l != 0 && mn.global.f_l < mn.global.line) {
    mn.global.file.add(args);
  }
}