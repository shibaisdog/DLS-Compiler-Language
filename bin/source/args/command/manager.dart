import 'command.dart';
class global {
  static int f_l = 0;
  static int r_l = 0;
  static int line = 0;
  static List<String> run = [];
  static List<String> file = [];
}
Future<void> manager(List<String> args) async {
  for (String i in args) {
    global.line += 1;
    version(i);
    run(i);
    file(i);
  }
}