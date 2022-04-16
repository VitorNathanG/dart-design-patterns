import 'interfaces.dart';
import 'widget_implementation.dart';

class WindowsWidgetFactory implements WidgetFactory {
  @override
  Button button() {
    return WindowsButton();
  }

  @override
  Label label() {
    return WindowsLabel();
  }

  @override
  TextField textField() {
    return WindowsTextField();
  }
}

class LinuxWidgetFactory implements WidgetFactory {
  @override
  Button button() {
    return LinuxButton();
  }

  @override
  Label label() {
    return LinuxLabel();
  }

  @override
  TextField textField() {
    return LinuxTextField();
  }
}

class MacWidgetFactory implements WidgetFactory {
  @override
  Button button() {
    return MacButton();
  }

  @override
  Label label() {
    return MacLabel();
  }

  @override
  TextField textField() {
    return MacTextField();
  }
}
