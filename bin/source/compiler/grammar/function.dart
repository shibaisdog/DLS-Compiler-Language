import '../compiler.dart';
import '../spacing.dart';
Future<List<dynamic>> repl(String text) async {
  if (global.function != -1) {
    if (text.trim() == "}" || text.trim() == "};") {
      global.function = -1;
      return [true,text,true];
    }
    return [true,text,false];
  }
  if (text.indexOf('def') < 0) {return [false,text,false];}
  if (text.indexOf('(') < 0 || text.indexOf(')') < 0) {return [false,text,false];}
  String name = text.substring(text.indexOf('def')+3,text.indexOf('('));
  String args = text.substring(text.indexOf('(')+1,text.indexOf(')'));
  String next = text.substring(text.indexOf(')')+1);
  global.function = await cking(text);
  String out;
  name = name.trim();
  if (text.indexOf('async') < 0) {
    out = 'dynamic $name($args)$next';
  } else {
    out = 'Future<dynamic> $name($args)$next';
  }
  return [true,out,true];
}