/// This flyweight example is an original example
/// The pool manages all VeryHeavy objects, sharing the immutable objects
void main() {
  VeryHeavyPool veryHeavyPool1 = VeryHeavyPool();
  var anObject1 = new NormalObject("a", 1, veryHeavyPool1.getOrCreate("char"));
  var anotherObject1 = new NormalObject("a", 1, veryHeavyPool1.getOrCreate("char"));

  print(anObject1.veryHeavy == anotherObject1.veryHeavy);

  var anObject2 = new NormalObject("a", 1, VeryHeavy("abc"));
  var anotherObject2 = new NormalObject("a", 1, VeryHeavy("abc"));

  print(anObject2.veryHeavy == anotherObject2.veryHeavy);
}

class VeryHeavyPool {
  Map<String, VeryHeavy> veryHeavyPool = {};
  
  void add(VeryHeavy veryHeavy) {
    if (!veryHeavyPool.containsKey(veryHeavy.characteristic)) {
      veryHeavyPool.putIfAbsent(veryHeavy.characteristic, () => veryHeavy);
    }
  }

  VeryHeavy getOrCreate(String characteristic) {
    if(!veryHeavyPool.containsKey(characteristic)) {
      add(VeryHeavy(characteristic));
    }
    return veryHeavyPool[characteristic]!;
  }
}

class VeryHeavy {
  VeryHeavy(this.characteristic) {
    this._heavyString = characteristic * 10000000;
  }

  String characteristic;
  String _heavyString = "";
}

class NormalObject {
  NormalObject(this.a, this.b, this.veryHeavy);
  
  String a;
  int b;
  VeryHeavy veryHeavy;
}