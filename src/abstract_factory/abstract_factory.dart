import 'interfaces.dart';

/// Not the best class organization. It was done like this solely to reduce the amount of files
void main() {
  WidgetFactory widgetFactory = WidgetFactory.get();

  widgetFactory.button().click();
  widgetFactory.textField().clear();
  widgetFactory.label().render();
}
