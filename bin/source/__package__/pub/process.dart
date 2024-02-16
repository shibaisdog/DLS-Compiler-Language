import 'dart:io';
Future<void> get() async {
  Process.run('dart',['pub','get']).then((ProcessResult result) {
    print(result.stdout);
    print(result.stderr);
  });
}