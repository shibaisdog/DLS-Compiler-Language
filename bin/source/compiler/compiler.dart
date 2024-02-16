import 'grammar/variable.dart' as variable;
import 'grammar/function.dart' as function;
import 'grammar/import.dart' as imports;
import 'grammar/integer-literals.dart' as integer;
import 'grammar/comment.dart' as comment;
import 'spacing.dart' as spacing;
import 'semicolon.dart' as semicolon;
class global {
  static List<String> variable = [];
  static List<String> Global = [];
  static List<String> IMPORT = [];
  static List<int> function = [];
  static List<int> if_elif_else = [];
}
Future<int> reset() async {
  global.variable = [];
  global.Global = [];
  global.IMPORT = [];
  global.function = [];
  global.if_elif_else = [];
  return 0;
}
Future<List<dynamic>> load(String text) async {
  bool reFun = true;
  bool IMPORTS = false;
  bool Independent_execution = false;
  int e = await spacing.cking(text);
  //////////////////
  List<dynamic> fun = await function.repl(text);
  if (fun[0] == true) {
    Independent_execution = true;
    global.variable = [];
    e = await spacing.cking(text.trim());
  }
  if (fun[2] == true) {
    reFun = false;
  }
  text = fun[1];
  //////////////////
  List<dynamic> vari = variable.repl(text);
  if (vari[0].runtimeType != bool) {
    global.variable.add(vari[0]);
  }
  if (vari[2] != false) {
    global.Global.add(vari[2]);
  }
  text = vari[1];
  //////////////////
  List<dynamic> ipr = await imports.repl(text);
  if (ipr[0]) {
    IMPORTS = true;
    reFun = false;
  }
  if (ipr[2] != null) {
    global.IMPORT.add(ipr[2]);
  }
  text = ipr[1];
  //////////////////
  text = integer.repl(text);
  text = comment.repl(text);
  //////////////////
  if (!reFun) {
    text = '${text.trim()}';
  } else {
    text = '${await spacing.add(e+2)}${text.trim()}';
  }
  text = semicolon.add(text);
  return [Independent_execution,IMPORTS,text,[]];
}