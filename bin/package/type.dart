import 'dart:convert';
String str(dynamic a) {
  return a.toString();
}
int num(dynamic a) {
  return int.parse(a);
}
String encode(dynamic data) {
  return jsonEncode(data);
}
dynamic decode(String data) {
  return jsonDecode(data);
}