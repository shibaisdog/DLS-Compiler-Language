duplication(List<dynamic> list,String cking) {
  for (final i in list) {
    if (i == cking) {
      return true;
    }
  }
  return false;
}
repl(List<dynamic> list,String text) {
  if (text.indexOf('=') < 0 ) {return [false,text];}
  final name = (text.substring(0,text.indexOf('='))).replaceAll(" ","");
  final value = (text.substring(text.indexOf('=')+1)).trim();
  final out;
  if (duplication(list,name)) {
    out = '${name} = ${value}';
  } else {
    out = 'var ${name} = ${value}';
  }
  return [name,out];
}