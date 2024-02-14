import '../../__package__/pak.dart';
Future<List<dynamic>> repl(String text) async {
  if (text.indexOf("import") < 0) {return [false,text];}
  else {
    text = text.replaceAll("DLS:",global.package);
    return [true,text];
  }
}