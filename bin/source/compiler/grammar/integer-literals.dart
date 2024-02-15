import 'dart:core';
String repl(String line) {
  RegExp re = RegExp(r'\b\d+_\d+(_\d{3})*\b');
  while (true) {
    Match? match = re.firstMatch(line);
    if (match != null) {
      String name = match.group(0)!.replaceAll('_', '');
      line = line.replaceAll(match.group(0)!, name);
    } else {
      break;
    }
  }
  return line;
}