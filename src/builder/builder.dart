import 'car.dart';

///It's trivial to implement builder-like structures using optional constructor parameters in dart.
///The 'build' methods act like directors.
///If the order matters, it's easy to implement a classic builder/director group using setters.
void main() {
  CarBuilder carBuilder = CarBuilder();
  print(carBuilder.buildSUV());
  print(carBuilder.buildBritishCar());
}

class CarBuilder {
  Car buildCar() {
    return Car();
  }

  Car buildSUV() {
    return Car(
      numberOfSeats: 7,
      weight: 2000,
      GPS: true,
      tripComputer: true,
      snowTires: true,
    );
  }

  Car buildBritishCar() {
    return Car(
      weight: 1400,
      GPS: true,
      rightDriving: true,
    );
  }
}
