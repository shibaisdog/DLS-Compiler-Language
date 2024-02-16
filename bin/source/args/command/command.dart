import 'dart:io';
import 'manager.dart' as mn;
void version(String args) {
  if (
    args == "-v" || 
    args == "--v" ||
    args == "-version" ||
    args == "--version"
  ) {
    print('DLS beta 0.0.6');
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
  if (mn.global.f_l != -1 && mn.global.f_l < mn.global.line && mn.global.r_l < mn.global.f_l) {
    mn.global.file.add(args);
  }
}
void run(String args) {
  if (
    args == "-r" ||
    args == "--r" ||
    args == "-run" ||
    args == "--run"
  ) {
    mn.global.r_l = mn.global.line;
    return;
  }
  if (mn.global.r_l != -1 && mn.global.r_l < mn.global.line && mn.global.f_l < mn.global.r_l) {
    mn.global.run.add(args);
  }
}