/// This patterns does not have a clean implementation without internal classes
/// Dart does not support internal classes
void main() {
  Editor editor = Editor();
  editor.text = "This is the example text";
  Memento snapshot = editor.createSnapshot();

  editor.text = "This is another text";
  snapshot.restore();

  print(editor.text);
}

class Editor {
  String _text = "";
  int? _cursorX;
  int? _cursorY;
  int? _selectionWidth;

  set text(String text) => this._text = text;

  set cursorX(int x) => this._cursorX = x;

  set cursorY(int y) => this._cursorY = y;

  set selectionWidth(int width) => this._selectionWidth = width;

  String get text => _text;

  Memento createSnapshot() {
    return Snapshot(this, _text, _cursorX, _cursorY, _selectionWidth);
  }
}

abstract class Memento {
  void restore();
}

class Snapshot implements Memento {
  final Editor editor;
  final String _text;
  final int? _cursorX;
  final int? _cursorY;
  final int? _selectionWidth;

  Snapshot(this.editor, this._text, this._cursorX, this._cursorY,
      this._selectionWidth);

  @override
  void restore() {
    this.editor._text = this._text;
    this.editor._cursorX = this._cursorX;
    this.editor._cursorY = this._cursorY;
    this.editor._selectionWidth = this._selectionWidth;
  }
}
