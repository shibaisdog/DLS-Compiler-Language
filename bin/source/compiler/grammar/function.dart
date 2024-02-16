import '../compiler.dart';
import '../spacing.dart';
Future<List<dynamic>> repl(String text) async {
  bool RU = false;
  if (!global.function.isEmpty) {
    for (int i in global.function) {
      if (i >= await cking(text) || await cking(text) < 1) {
        if (text.indexOf("def") == -1) {
          global.function.remove(i);
          text = "<!PASS^>"+text;
          return [true,text,true];
        } else {
          RU = true;
        }
      }
    }
    if (!RU) {
      return [true,text,false];
    }
  }
  if (text.indexOf('def') < 0) {return [false,text,false];}
  if (text.indexOf('(') < 0 || text.indexOf(')') < 0) {return [false,text,false];}
  String name = text.substring(text.indexOf('def')+3,text.indexOf('('));
  String args = text.substring(text.indexOf('(')+1,text.indexOf(')'));
  String next = text.substring(text.indexOf(')')+1);
  next = next.replaceAll(":","{");
  global.function.add(await cking(text));
  String out;
  name = name.trim();
  if (text.indexOf('async') < 0) {
    out = 'dynamic $name($args)$next';
  } else {
    out = 'Future<dynamic> $name($args)$next';
  }
  if (RU) {
    out = "<!NEXT^>"+out;
  }
  return [true,out,true];
}