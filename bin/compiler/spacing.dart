cking(String text) async {
  int i = 0;
  while (true) {
    if (i>=text.length) {break;}
    if (text[0] != " ") {break;}
    text = text.substring(1);
    i++;
  }
  return i;
}
add(int number) async {
  int i = 0;
  String e = "";
  while (i <= number-1) {
    e += " ";
    i++;
  }
  return e;
}