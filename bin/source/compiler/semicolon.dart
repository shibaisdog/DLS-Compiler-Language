String add(String text) {
  if (!text.endsWith(';')) {
    int fun = text.indexOf("dynamic");
    if (text.endsWith(')') && fun > -1 || text.endsWith('(') && fun > -1) {return text;}
    else if (text.endsWith('}') || text.endsWith('{')) {return text;}
    else if (text.trim() == "") {return text;}
    text += ';';
  }
  return text;
}