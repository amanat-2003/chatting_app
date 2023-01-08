// main() {
//   var obj1 = const Display(2, 3);
//   var obj2 = const Display(2, 3);
//   // ignore: avoid_print
//   print(obj1 == obj2);
// }

class Display {
  final int x;
  final int y;
  const Display(this.x, this.y);
}

int? stringLength(String? nullableString) {
  return nullableString?.length;
}

void main(){
  print(stringLength(null));
}