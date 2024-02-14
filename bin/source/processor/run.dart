import 'dart:io';
void run(String file) {
  Process.run('dart',[file]).then((ProcessResult result) {
    print(result.stdout);
    print(result.stderr);
  });
}