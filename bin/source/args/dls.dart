import '../compiler/compiler.dart' as compiler;
import '../processor/file.dart' as file;
Future<String> dls(String filename) async {
  await compiler.reset();
  String file_ = filename.substring(filename.lastIndexOf('.'));
  filename = filename.replaceAll("/",'\\');
  //String path = '${filename.substring(0,filename.lastIndexOf('\\'))}\\__init__\\';
  //String fileafter = ('$path${filename.substring(filename.lastIndexOf('\\')+1)}').replaceAll(file_,".dart");
  String path = '.\\__init__\\${(filename.substring(0,filename.lastIndexOf('\\'))).replaceAll(".\\","")}\\';
  String fileafter = ('$path${filename.substring(filename.lastIndexOf('\\')+1)}').replaceAll(file_,".dart");
  String text = await file.read(filename);
  List<String> line = text.split('\n');
  String Independent_execution = "";
  String IMPORTS = "";
  String main = "";
  String out = "";
  for (String i in line) {
    List<dynamic> lo = await compiler.load(i);
    String a = lo[2];
    if (lo[0] == true) {
      if (a.indexOf("<!PASS^>") != -1) {
        Independent_execution += '}\n';
        main += a.substring(a.indexOf("<!PASS^>")+8)+"\n";
      } else if (a.indexOf("<!NEXT^>") != -1) {
        Independent_execution += '}\n';
        Independent_execution += a.substring(a.indexOf("<!NEXT^>")+8)+"\n";
      } else {
        Independent_execution += '${a}\n';
      }
      Independent_execution = Independent_execution.replaceAll("}\n}","}");
    } else if (lo[1] == true) {
      IMPORTS += '${a}\n';
    } else {
      main += '${a}\n';
    }
  }
  out = '$Independent_execution\nmain() async {\n${compiler.global.IMPORT.map((e) => '  await $e.main();').join('\n')}\n$main\n}';
  out = "${IMPORTS}class global {\n${compiler.global.Global.map((e) => '  static dynamic $e;').join('\n')}\n}\n$out";
  file.directory(path);
  file.write(fileafter,out);
  return fileafter;
}