void main() {
  BoxElement laptop = Item(1000, "Laptop");
  BoxElement smartphone = Item(750, "Smartphone");
  BoxElement buds = Item(200, "Wireless Buds");
  BoxElement watch = Item(1000, "Smartwatch");
  BoxElement microwave = Item(1000, "Microwave Oven");

  BoxElement tech = Box([laptop, smartphone]);
  BoxElement extras = Box([buds, watch]);
  BoxElement gadgets = Box([tech, extras]);
  BoxElement microwaveBox = Box([microwave]);
  BoxElement finalPackage = Box([gadgets, microwaveBox]);

  double totalPrice = finalPackage.calculatePrice();
  print("Total price is \$$totalPrice");
}

abstract class BoxElement {
  double calculatePrice();
}

class Item implements BoxElement {
  Item(this.price, this.name);

  double price;
  String name;

  @override
  double calculatePrice() {
    print("Product: $name. Price: \$$price");
    return price;
  }
}

class Box implements BoxElement {
  Box(this.boxElements);

  List<BoxElement> boxElements;

  @override
  double calculatePrice() {
    double totalPrice = boxElements
        .map((element) => element.calculatePrice())
        .reduce((sum, increment) => sum + increment);
    print("Box price: \$$totalPrice");
    return totalPrice;
  }
}
