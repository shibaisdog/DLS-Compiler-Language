import 'grammar/variable.dart' as variable;
import 'spacing.dart' as spacing;
import 'semicolon.dart' as semicolon;
class global {
  static var variable = [];
  static var Global = [];
}
load(String text) async {
  int e = await spacing.cking(text);
  final vari = variable.repl(global.variable,global.Global,text);
  if (vari[0].runtimeType != bool) {global.variable.add(vari[0]);}
  if (vari[2] != false) {global.Global.add(vari[2]);}
  text = vari[1];

  text = '${await spacing.add(e)}${text.trim()}';
  text = semicolon.add(text);
  return text;
}