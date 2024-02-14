import 'dls.dart';
import 'command/manager.dart';
main(List<String> args) async {
  await manager(args);
  for (String f in global.file) {
    dls(f);
  }
}