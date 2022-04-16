void main() {
  Shape square = Square(10, 1, color: "red", width: 20, height: 20);

  Shape newSquare = square.clone();

  print(newSquare);
}

abstract class Shape {
  int x;
  int y;

  Shape(this.x, this.y);

  Shape clone();
}

class Square extends Shape {
  String color;
  int width;
  int height;

  Square(x, y, {required this.color, required this.width, required this.height})
      : super(x, y);

  @override
  Shape clone() {
    return Square(this.x, this.y,
        color: this.color, width: this.width, height: this.height);
  }

  @override
  String toString() {
    return 'Square{x: $x, y: $y, color: $color, width: $width, height: $height}';
  }
}
