import '../load.dart' as load;
import '../../processor/file.dart' as file;
import 'dart:convert';
Future<void> onload() async {
  String data = await load.onload();
  dynamic json = jsonDecode(data);
  String name = "name: " + json['name'].toString();
  String vers = "version: " + json['version'].toString();
  String desc = "description: " + json['description'].toString();
  String repo = "repository: " + json['repository'].toString();
  String envi = "environment:";
  String depe = "dependencies:";
  if (json['environment'] != null) {
    for (dynamic i in json['environment']) {
      String en_name = i['name'];
      String en_vers = i['version'];
      envi += "\n  $en_name: $en_vers";
    }
  }
  if (json['package-list'] != null) {
    for (dynamic i in json['package-list']) {
      String de_name = i['name'];
      String de_vers = i['version'];
      depe += "\n  $de_name: $de_vers";
    }
  }
  String ret = "$name\n$vers\n$desc\n$repo\n$envi\n$depe";
  file.write("./__init__/pubspec.yaml",ret);
}
