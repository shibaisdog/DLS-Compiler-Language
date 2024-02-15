import '../../__package__/pak.dart';
Future<List<dynamic>> repl(String text) async {
  if (text.indexOf("import") < 0) {return [false,text,null];}
  else {
    if (text.indexOf("DLS:") < 0) {
      String ld;
      if (text.indexOf('"') < 0 && text.indexOf("'") > -1) {
        ld = text.substring(text.indexOf("'")+1,text.lastIndexOf("'"));
      } else {
        ld = text.substring(text.indexOf('"')+1,text.lastIndexOf('"'));
      }
      String fn = text.substring(text.lastIndexOf(".")+1);
      if (fn != "dart") {
        text = text.replaceAll(fn,"dart");
      }
      String name = text.substring(text.indexOf("/")+1,text.lastIndexOf("."));
      name = name.trim();
      name = name.replaceAll("/","_");
      name = name.replaceAll("\\","_");
      String out = 'import "$ld" as $name';
      return [true,out,name];
    } else {
      text = text.replaceAll("DLS:",global.package);
      return [true,text,null];
    }
  }
}