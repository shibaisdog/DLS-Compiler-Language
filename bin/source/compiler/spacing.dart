Future<int> cking(String text) async {
  int i = 0;
  while (i < text.length && text[i] == " ") {
    i++;
  }
  return i;
}
Future<String> add(int number) async {
  int i = 0;
  String e = "";
  while (i <= number-1) {
    e += " ";
    i++;
  }
  return e;
}
Future<String> nadd(String text,int number) async {
  int i = 0;
  text = text.trim();
  while (i <= number-1) {
    text = " $text";
    i++;
  }
  return text;
}