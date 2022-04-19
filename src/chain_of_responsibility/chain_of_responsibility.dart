void main() {
  Component container = Container();
  Component component1= Component(parent: container, helpText: "Help message here");
  Component component2 = Component(parent: component1);
  Component component3 = Component(parent: component2, helpText: "Another help message");

  component3.showHelp(); //Shows component3 message
  component2.showHelp(); //Shows component1 message
  component1.showHelp(); //Shows component1 message
  container.showHelp(); //Shows container message
}

abstract class ComponentWithContextualHelp {
  void showHelp();
}

class Component implements ComponentWithContextualHelp {
  Component({this.parent, this.helpText});

  Component? parent;
  String? helpText;

  @override
  void showHelp() {
    if(helpText != null) {
      print(helpText);
      return;
    }
    parent?.showHelp();
  }
}

class Container extends Component {
  @override
  void showHelp() {
    print("Not custom message");
  }
}