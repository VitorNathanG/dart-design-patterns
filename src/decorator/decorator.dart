void main() {
  ApplicationText string = NormalApplicationText("Hello World!");
  ApplicationText boldString = BoldApplicationText(string);
  ApplicationText boldAndItalicString = ItalicsApplicationText(boldString);

  print(boldAndItalicString.getText());
}

abstract class ApplicationText {
  String getText();
  void setText(String text);
}

class NormalApplicationText implements ApplicationText {
  String text;
  NormalApplicationText(this.text);

  @override
  String getText() {
    return text;
  }

  @override
  void setText(String text) {
    this.text = text;
  }
}

class BoldApplicationText implements ApplicationText {
  ApplicationText applicationText;

  BoldApplicationText(this.applicationText) {
    this.applicationText = applicationText;
    this.applicationText.setText("<b>" + this.getText() + "</b>");
  }

  @override
  String getText() {
    return this.applicationText.getText();
  }

  @override
  void setText(String text) {
    this.applicationText.setText(text);
  }
}


class ItalicsApplicationText implements ApplicationText {
  ApplicationText applicationText;

  ItalicsApplicationText(this.applicationText) {
    this.applicationText = applicationText;
    this.applicationText.setText("<i>" + this.getText() + "</i>");
  }

  @override
  String getText() {
    return this.applicationText.getText();
  }

  @override
  void setText(String text) {
    this.applicationText.setText(text);
  }
}