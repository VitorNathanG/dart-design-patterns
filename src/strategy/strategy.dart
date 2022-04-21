import 'dart:io';

void main() {
  Context context = Context();
  print("First number: ");
  String a = stdin.readLineSync()!;
  print("Second number: ");
  String b = stdin.readLineSync()!;
  print("Operation (+, - or *): ");
  String op = stdin.readLineSync()!;

  if (op == "+") {
    context.strategy = SumStrategy();
  } else if (op == "-") {
    context.strategy = SubtractStrategy();
  } else if (op == "*") {
    context.strategy = MultiplyStrategy();
  } else {
    throw ArgumentError("Invalid operation type: $op");
  }
  num result = context.executeStrategy(int.tryParse(a)!, int.tryParse(b)!);

  print(result);
}

abstract class Strategy {
  num executeOperation(int a, int b);
}

class SumStrategy implements Strategy {
  @override
  num executeOperation(int a, int b) {
    return a + b;
  }
}

class SubtractStrategy implements Strategy {
  @override
  num executeOperation(int a, int b) {
    return a - b;
  }
}

class MultiplyStrategy implements Strategy {
  @override
  num executeOperation(int a, int b) {
    return a * b;
  }
}

class Context {
  late Strategy _strategy;

  set strategy(Strategy strategy) => _strategy = strategy;

  num executeStrategy(int a, int b) {
    return _strategy.executeOperation(a, b);
  }
}
