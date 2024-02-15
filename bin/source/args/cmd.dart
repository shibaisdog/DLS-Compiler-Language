import 'dls.dart' as dls;
import 'command/manager.dart';
import '../processor/run.dart' as run;
import '../__package__/pak.dart' as pak;
Future<void> main(List<String> args) async {
  pak.setup(args);
  await manager(args);
  if ((global.file).length == 1) {
    String rf = await dls.dls((global.file)[0].toString());
    run.run(rf);
  } else {
    for (String f in global.file) {
      String rf = await dls.dls(f.toString());
      for (String r in global.run) {
        if (r == f) {
          run.run(rf);
        }
      }
    }
  }
}