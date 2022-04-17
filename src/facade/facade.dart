/// This facade example is an original example
/// Be careful not to create a god object
void main() {
  Cleaner cleaner = new Cleaner(
    LaundryMinion(),
    DishesMinion(),
    FloorMinion(),
    CarWasherMinion(),
  );
  cleaner.clean();
}

class Cleaner {
  Cleaner(
    this.laundryMinion,
    this.dishesMinion,
    this.floorMinion,
    this.carWasherMinion,
  );

  LaundryMinion laundryMinion;
  DishesMinion dishesMinion;
  FloorMinion floorMinion;
  CarWasherMinion carWasherMinion;

  void clean() {
    laundryMinion.sortClothes();
    laundryMinion.applyDetergent();
    carWasherMinion.findCleaningUtensils();
    floorMinion.mop();
    dishesMinion.doDishes();
    dishesMinion.organizeKitchen();
    floorMinion.putWetFloorSign();
    laundryMinion.removeClothesFromTheDryer();
    laundryMinion.fold();
  }
}

class CarWasherMinion {
  void findCleaningUtensils() {}
}

class FloorMinion {
  void mop() {}

  void putWetFloorSign() {}
}

class DishesMinion {
  void doDishes() {}

  void organizeKitchen() {}
}

class LaundryMinion {
  void sortClothes() {}

  void applyDetergent() {}

  void removeClothesFromTheDryer() {}

  void fold() {}
}
