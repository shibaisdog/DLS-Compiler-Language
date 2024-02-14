import 'grammar/variable.dart' as variable;
import 'grammar/function.dart' as function;
import 'spacing.dart' as spacing;
import 'semicolon.dart' as semicolon;
class global {
  static var variable = [];
  static var Global = [];
  static int function = -1;
}
Future<List<dynamic>> load(String text) async {
  bool reFun = true;
  bool Independent_execution = false;
  int e = await spacing.cking(text);
  List<dynamic> vari = variable.repl(text);
  if (vari[0].runtimeType != bool) {
    global.variable.add(vari[0]);
  }
  if (vari[2] != false) {
    global.Global.add(vari[2]);
  }
  text = vari[1];
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
  if (!reFun) {
    text = '${text.trim()}';
  } else {
    text = '${await spacing.add(e+2)}${text.trim()}';
  }
  text = semicolon.add(text);
  return [Independent_execution,text];
}