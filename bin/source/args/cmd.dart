import 'dls.dart';
import 'command/manager.dart';
import '../__package__/pak.dart' as pak;
main(List<String> args) async {
  pak.setup(args);
  await manager(args);
  for (String f in global.file) {
    dls(f);
  }
}