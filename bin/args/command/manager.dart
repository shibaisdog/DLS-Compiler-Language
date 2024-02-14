import 'command.dart';
class global {
  static int f_l = 0;
  static int line = 0;
  static List<String> file = [];
}
manager(List<String> args) {
  for (String i in args) {
    global.line += 1;
    version(i);
    file(i);
  }
}