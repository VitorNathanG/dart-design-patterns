/// This pattern is crap, but here it is
void main() {
  Mediator mediator = FormDialog();
  Component button = Button(mediator);
  Component checkbox = CheckBox(mediator);

  button.doComponentThings();
  checkbox.doComponentThings();
}

abstract class Component {
  void doComponentThings();
}

abstract class Mediator {
  void notify(Component component, String event);
}

class FormDialog implements Mediator {
  @override
  void notify(Component component, String event) {
    if (event == "buttonClicked") {
      print("The button was clicked");
    } else if (event == "checkBoxClicked") {
      print("The checkbox says hi");
    }
  }
}

class Button implements Component {
  Button(this.mediator);

  Mediator mediator;

  @override
  void doComponentThings() {
    mediator.notify(this, "buttonClicked");
  }
}

class CheckBox implements Component {
  CheckBox(this.mediator);

  Mediator mediator;

  @override
  void doComponentThings() {
    mediator.notify(this, "checkBoxClicked");
  }
}
