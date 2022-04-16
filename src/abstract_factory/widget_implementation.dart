import 'interfaces.dart';

class WindowsButton implements Button {
  @override
  void click() {
    print("Clicked on a Windows button!");
  }
}

class MacButton implements Button {
  @override
  void click() {
    print("Clicked on a macOS button!");
  }
}

class LinuxButton implements Button {
  @override
  void click() {
    print("Clicked on a Linux button!");
  }
}

class WindowsTextField implements TextField {
  @override
  void clear() {
    print("Cleared the Windows textField!");
  }
}

class MacTextField implements TextField {
  @override
  void clear() {
    print("Cleared the macOS textField!");
  }
}

class LinuxTextField implements TextField {
  @override
  void clear() {
    print("Cleared the Linux textField!");
  }
}

class WindowsLabel implements Label {
  @override
  void render() {
    print("Rendered the Windows label!");
  }
}

class MacLabel implements Label {
  @override
  void render() {
    print("Rendered the macOS label!");
  }
}

class LinuxLabel implements Label {
  @override
  void render() {
    print("Rendered the Linux label!");
  }
}
