class global {
  static String package = "";
}
void setup(List<String> args) {
  global.package = "file:///"+("${args[0]}package/".replaceAll("\\","/").replaceAll("//","/"));
}