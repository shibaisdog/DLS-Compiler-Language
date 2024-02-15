import '../processor/file.dart' as file;
import './pub/process.dart' as pub;
import 'dart:convert';
Future<String> onload() async {
  try {
    await file.read("pak.json");
  } catch (error) {
    await init();
  }
  return await file.read("pak.json");
}
Future<void> init() async {
  dynamic data = {
    "name":"index",
    "version":"0.0.1",
    "description":"index",
    "repository":"index",
    "environment":[
      {
        "name":"sdk",
        "version":"^3.2.0"
      }
    ],
    "package-list":[]
  };
  file.write("pak.json",jsonEncode(data));
}
void package_get() {
  pub.get();
}