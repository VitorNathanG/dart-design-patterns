void main() {
  Button saveButton = Button(SaveCommand());
  Button deleteButton = Button(DeleteCommand());

  saveButton.onPressed(); // Will print 'Saved the workspace'
  deleteButton.onPressed(); // Will print 'Deleted the workspace'
}

abstract class Command {
  void execute();
}

class Button {
  Button(this.command);

  Command command;

  void onPressed() {
    command.execute();
  }
}

class SaveCommand implements Command {
  @override
  void execute() {
    print("Saved the workspace");
  }
}

class DeleteCommand implements Command {
  @override
  void execute() {
    print("Deleted the workspace");
  }
}
