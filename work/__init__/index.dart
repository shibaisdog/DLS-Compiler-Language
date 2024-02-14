class global {
static var i;
}
main() {
    var i = 0;
    global.i = 0;
    print(i);
    print(global.i);
    i = 10;
    global.i = 20;
    print(i);
    print(global.i);
}
