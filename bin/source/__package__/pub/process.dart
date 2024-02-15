import 'dart:io';
void get() {
  Process.run('dart',['pub','get','--no-example']).then((ProcessResult result) {
    print(result.stdout);
    print(result.stderr);
  });
}