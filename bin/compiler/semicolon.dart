add(String text) {
  if (!text.endsWith(';')) {
    if (text.endsWith('}') || text.endsWith('{')) {return text;}
    text += ';';
  }
  return text;
}