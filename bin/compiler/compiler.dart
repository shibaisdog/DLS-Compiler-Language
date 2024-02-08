import 'grammar/variable.dart' as variable;
import 'spacing.dart' as spacing;
import 'semicolon.dart' as semicolon;
class global {
  static var variable = [];
}
load(String text) async {
  int e = await spacing.cking(text);
  final vari = variable.repl(global.variable,text);
  if (vari[0].runtimeType != bool) {global.variable.add(vari[0]);}
  text = vari[1];
  text = '${await spacing.add(e)}${text.trim()}';
  text = semicolon.add(text);
  return text;
}