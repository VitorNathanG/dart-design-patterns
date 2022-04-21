void main() {
  List<Shape> shapes = [Circle(1, 2, 10), Dot(-1, -4), Rectangle(1, 1, 0, -3)];
  Visitor stringExporterVisitor = StringExporterVisitor();

  shapes.forEach((element) {
    print(element.accept(stringExporterVisitor));
  });
}

abstract class Shape {
  String accept(Visitor visitor);
}

abstract class Visitor {
  String visitDot(Dot dot);

  String visitRectangle(Rectangle rectangle);

  String visitCircle(Circle circle);
}

class StringExporterVisitor implements Visitor {
  @override
  String visitCircle(Circle circle) {
    return "X: ${circle.x}; Y: ${circle.y}; Radius: ${circle.radius}";
  }

  @override
  String visitDot(Dot dot) {
    return "X: ${dot.x}; Y: ${dot.y}";
  }

  @override
  String visitRectangle(Rectangle rectangle) {
    return "X1: ${rectangle.x1}; Y1: ${rectangle.y1}; X2: ${rectangle.x2}; Y2: ${rectangle.y2}";
  }
}

class Dot implements Shape {
  Dot(this.x, this.y);

  int x;
  int y;

  @override
  String accept(Visitor visitor) {
    return visitor.visitDot(this);
  }
}

class Rectangle implements Shape {
  Rectangle(this.x1, this.x2, this.y1, this.y2);

  int x1;
  int x2;
  int y1;
  int y2;

  @override
  String accept(Visitor visitor) {
    return visitor.visitRectangle(this);
  }
}

class Circle implements Shape {
  Circle(this.x, this.y, this.radius);

  int x;
  int y;
  int radius;

  @override
  String accept(Visitor visitor) {
    return visitor.visitCircle(this);
  }
}
