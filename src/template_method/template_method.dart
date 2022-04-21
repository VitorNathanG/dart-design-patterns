/// Dart does not have final or protected methods
void main() {
  var orcsAI = OrcsAI();
  orcsAI.takeTurn();

  print("");

  var monstersAI = MonstersAI();
  monstersAI.takeTurn();
}

abstract class GameAI {
  void takeTurn() {
    collectResources();
    buildStructures();
    buildUnits();
    attack();
  }

  void collectResources() {
    // Default collectResources impl
    print("Collecting resources");
  }

  void buildStructures();

  void buildUnits();

  void attack() {
    sendScouts("north");
    sendWarriors("south");
  }

  void sendScouts(position);

  void sendWarriors(position);
}

class OrcsAI extends GameAI {
  void buildStructures() {
    print("Orc building structures");
  }

  void buildUnits() {
    print("Orc building units");
  }

  void sendScouts(position) {
    print("Orc sending scouts");
  }

  void sendWarriors(position) {
    print("Orc sending warriors");
  }
}

class MonstersAI extends GameAI {
  void collectResources() {
    // Monsters can't collect resources
  }

  void buildStructures() {
    // Monsters can't build structures
  }

  void buildUnits() {
    // Monsters can't build units
  }

  void sendScouts(position) {
    print("Monster sending scouts");
  }

  void sendWarriors(position) {
    print("Monster sending warriors");
  }
}