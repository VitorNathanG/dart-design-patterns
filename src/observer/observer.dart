void main() {
  Subscriber emailAlertsListener = EmailAlertsListener();
  Subscriber loggingListener = LoggingListener();

  EventManager eventManager = EventManager();
  eventManager.subscribe(emailAlertsListener, "openFile");
  eventManager.subscribe(loggingListener, "saveFile");

  Editor editor = Editor(eventManager);
  editor.openFile("/var/lib/test.txt");
  editor.saveFile("/var/lib/test.txt");
}

class EventManager {
  Map<String, Set<Subscriber>> subscribers = {};

  void subscribe(Subscriber subscriber, String eventType) {
    if(subscribers[eventType] == null) {
      subscribers[eventType] = Set();
    }
    subscribers[eventType]!.add(subscriber);
  }

  void unsubscribe(Subscriber subscriber, String eventType) {
    if(subscribers[eventType] == null) {
      subscribers[eventType] == [];
      return;
    }
    subscribers[eventType]!.remove(subscriber);
  }

  void notifySubscribers(String eventType, String data) {
    if(subscribers[eventType] == null) {
      subscribers[eventType] == [];
      return;
    }
    subscribers[eventType]!.forEach((subscriber) => subscriber.update(data));
  }
}

abstract class Subscriber {
  void update(String data);
}

class Editor {
  Editor(this.eventManager);

  EventManager eventManager;

  void openFile(String filePath) {
    eventManager.notifySubscribers(
        "openFile", "The following file has been opened $filePath");
  }

  void saveFile(String filePath) {
    eventManager.notifySubscribers(
        "saveFile", "The following file has been saved $filePath");
  }
}

class EmailAlertsListener implements Subscriber {
  @override
  void update(String data) {
    print("Something happened!: $data");
  }
}

class LoggingListener implements Subscriber {
  @override
  void update(String data) {
    print("Log information: $data");
  }
}
