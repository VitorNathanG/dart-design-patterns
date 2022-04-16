/// The main method does not depend on any implementation besides the factory itself,
/// dynamically creating the desired delivery option
void main() {
  LogisticsFactory seaLogisticsFactory = LogisticsFactory("This continent");
  seaLogisticsFactory.createTransport().deliver("Laptop");

  LogisticsFactory roadLogisticsFactory = LogisticsFactory("Other continent");
  roadLogisticsFactory.createTransport().deliver("Smartphone");
}

class LogisticsFactory {
  LogisticsFactory(this._destination);

  String _destination;

  Transport createTransport() {
    if (_destination == "This continent") {
      return SeaLogistics().createTransport();
    } else if (_destination == "Other continent") {
      return RoadLogistics().createTransport();
    }
    throw UnimplementedError();
  }
}

abstract class Logistics {
  Transport createTransport();
}

abstract class Transport {
  void deliver(String product);
}

class SeaLogistics implements Logistics {
  @override
  Transport createTransport() {
    return Ship();
  }
}

class RoadLogistics implements Logistics {
  @override
  Transport createTransport() {
    return Truck();
  }
}

class Ship implements Transport {
  @override
  void deliver(String product) {
    print("Delivering $product by sea!");
  }
}

class Truck implements Transport {
  @override
  void deliver(String product) {
    print("Delivering $product by road!");
  }
}
