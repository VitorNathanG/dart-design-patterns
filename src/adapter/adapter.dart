/// Example adapted from https://www.geeksforgeeks.org/adapter-pattern/
/// Adapts real birds to be used in place of a toy duck
void main() {
  Bird bird = UnladenSwallow();
  bird.makeSound();

  ToyDuck toyDuck = PlasticToyDuck();
  toyDuck.squeak();

  ToyDuck adaptedToyDuck = BirdAdapter(bird);

  // Will print 'Bird sounds'
  adaptedToyDuck.squeak();
}

abstract class Bird {
  void fly();
  void makeSound();
}

abstract class ToyDuck {
  void squeak();
}

class PlasticToyDuck implements ToyDuck {
  @override
  void squeak() {
    print("Squeak");
  }
}

class UnladenSwallow implements Bird {
  @override
  void fly() {
    print("Flying with the airspeed velocity of an unladen swallow");
  }

  @override
  void makeSound() {
    print("Bird sounds");
  }
}

class BirdAdapter implements ToyDuck {
  Bird _bird;

  BirdAdapter(this._bird);

  @override
  void squeak() {
    _bird.makeSound();
  }
}