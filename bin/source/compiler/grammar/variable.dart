import '../compiler.dart';
bool duplication(List<dynamic> list,String cking) {
  for (final i in list) {
    if (i == cking) {
      return true;
    }
  }
  return false;
}
List<dynamic> repl(String text) {
  if (text.indexOf('=') < 0 ) {return [false,text,false];}
  String name = (text.substring(0,text.indexOf('='))).replaceAll(" ","");
  String value = (text.substring(text.indexOf('=')+1)).trim();
  int gi = name.indexOf("global.");
  String gl;
  if (gi > -1) {
    gl = text.substring(0,name.indexOf("global."));
  } else {
    gl = "";
  }
  if (name.trim() == "" || value.trim() == "") {return [false,text,false];}
  if (name.indexOf("global.") != -1) {
    if (duplication(global.Global,name.replaceAll("global.",""))) {
      return [false,'${name} = ${value}',false];
    } else {
      if (gl.trim() == "") {
        return [name,'${name} = ${value}',name.replaceAll("global.","")];
      }
      return [false,'${name} = ${value}',false];
    }
  } else {
    if (duplication(global.variable,name)) {
      return [false,'${name} = ${value}',false];
    } else {
      return [name,'var ${name} = ${value}',false];
    }
  }
}