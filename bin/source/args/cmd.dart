import 'dls.dart';
import 'command/manager.dart';
import '../processor/run.dart' as run;
import '../__package__/pak.dart' as pak;
main(List<String> args) async {
  pak.setup(args);
  await manager(args);
  for (String f in global.file) {
    String rf = await dls(f);
    for (String r in global.run) {
      if (r == f) {
        run.run(rf);
      }
    }
  }
}