duplication(List<dynamic> list,String cking) {
  for (final i in list) {
    if (i == cking) {
      return true;
    }
  }
  return false;
}
repl(List<dynamic> list,List<dynamic> global,String text) {
  if (text.indexOf('=') < 0 ) {return [false,text,false];}
  final name = (text.substring(0,text.indexOf('='))).replaceAll(" ","");
  final value = (text.substring(text.indexOf('=')+1)).trim();
  if (name.indexOf("global.") != -1) {
    if (duplication(global,name.replaceAll("global.",""))) {
      return [false,'${name} = ${value}',false];
    } else {
      return [name,'${name} = ${value}',name.replaceAll("global.","")];
    }
  } else {
    if (duplication(list,name)) {
      return [false,'${name} = ${value}',false];
    } else {
      return [name,'var ${name} = ${value}',false];
    }
  }
}