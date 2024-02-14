import 'compiler/compiler.dart' as compiler;
import 'processor/file.dart' as file;
import 'processor/run.dart' as run;
main() async {
  String filename = "G:\\내 드라이브\\코딩\\DLS\\work\\index.ds";
  String file_ = filename.substring(filename.lastIndexOf('.'));
  filename = filename.replaceAll("/",'\\');
  String path = '${filename.substring(0,filename.lastIndexOf('\\'))}\\__init__\\';
  String fileafter = ('$path${filename.substring(filename.lastIndexOf('\\')+1)}').replaceAll(file_,".dart");
  String text = file.read(filename);
  final line = text.split('\n');
  var out = "";
  for (final i in line) {
    out += '${await compiler.load(i)}\n';
  }
  out = "class global {\n" + compiler.global.Global.map((e) => 'static var $e;').join('\n') + '\n}\n$out';
  file.directory(path);
  file.write(fileafter,out);
  if (out.replaceAll(" ","").indexOf('main()') > -1) {
    run.run(fileafter);
  }
}