String add(String text) {
  if (!text.endsWith(';')) {
    if (text.endsWith('}') || text.endsWith('{')) {return text;}
    else if (text.trim() == "") {return text;}
    text += ';';
  }
  return text;
}