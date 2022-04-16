class Car {
  int numberOfSeats;
  double weight;
  int year;
  int mileage;
  bool rightDriving;
  bool GPS;
  bool tripComputer;
  bool snowTires;

  Car({
    this.numberOfSeats = 5,
    this.weight = 1000,
    this.year = 2022,
    this.mileage = 0,
    this.rightDriving = false,
    this.GPS = false,
    this.tripComputer = false,
    this.snowTires = false,
  });

  @override
  String toString() {
    return 'Car{numberOfSeats: $numberOfSeats, weight: $weight, year: $year, '
        'mileage: $mileage, rightDriving: $rightDriving, GPS: $GPS, tripComputer: '
        '$tripComputer, snowTires: $snowTires}';
  }
}
