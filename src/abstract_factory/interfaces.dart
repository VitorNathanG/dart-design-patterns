import 'dart:io';

import 'os_factories.dart';

abstract class WidgetFactory {
  Button button();

  TextField textField();

  Label label();

  static WidgetFactory get() {
    if (Platform.isWindows) {
      return WindowsWidgetFactory();
    } else if (Platform.isMacOS) {
      return MacWidgetFactory();
    } else if (Platform.isLinux) {
      return LinuxWidgetFactory();
    }
    throw UnsupportedError("Unsupported OS");
  }
}

abstract class Button {
  void click();
}

abstract class TextField {
  void clear();
}

abstract class Label {
  void render();
}
