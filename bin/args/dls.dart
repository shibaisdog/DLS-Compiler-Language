import '../compiler/compiler.dart' as compiler;
import '../processor/file.dart' as file;
import '../processor/run.dart' as run;
void dls(String filename) async {
  String file_ = filename.substring(filename.lastIndexOf('.'));
  filename = filename.replaceAll("/",'\\');
  String path = '${filename.substring(0,filename.lastIndexOf('\\'))}\\__init__\\';
  String fileafter = ('$path${filename.substring(filename.lastIndexOf('\\')+1)}').replaceAll(file_,".dart");
  String text = file.read(filename);
  final line = text.split('\n');
  String Independent_execution = "";
  String main = "";
  String out = "";
  for (final i in line) {
    List<dynamic> lo = await compiler.load(i);
    if (lo[0] == true) {
      Independent_execution += '${lo[1]}\n';
    } else {
      main += '${lo[1]}\n';
    }
  }
  out = '$Independent_execution\nmain() {\n$main\n}';
  out = "class global {\n" + compiler.global.Global.map((e) => 'static var $e;').join('\n') + '\n}\n$out';
  file.directory(path);
  file.write(fileafter,out);
  if (out.replaceAll(" ","").indexOf('main()') > -1) {
    run.run(fileafter);
  }
}