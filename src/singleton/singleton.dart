void main() {
  var oneInstance = OneInstance();
  var otherInstance = OneInstance();

  print(oneInstance == otherInstance);
}

class OneInstance {
  // Defines the named constructor as private
  OneInstance._privateContructor();

  static final OneInstance _instance = OneInstance._privateContructor();

  factory OneInstance() {
    return _instance;
  }
}
