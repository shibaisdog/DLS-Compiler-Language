import 'command.dart';
class global {
  static int line = -1;
}
Future<void> manager(List<String> args) async {
  for (String i in args) {
    global.line += 1;
    version(i);
    await get(i);
    await init(i);
  }
}