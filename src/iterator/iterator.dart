/// Classic implementation of an iterator over a singly linked list
void main() {
  List<String> list = List();
  list.add("abc");
  list.add("123");
  list.add("def");
  var iterator = list.iterator();

  while(iterator.hasNext()) {
    print(iterator.get());
  }
}

abstract class Iterator<T> {
  T? get();
  bool hasNext();
}

abstract class Iterable<T> {
  Iterator<T> iterator();
}

class ListElement<T> {
  ListElement(this.data);

  T? data;
  ListElement<T>? nextElement;
}

class List<T> implements Iterable<T>{
  ListElement<T>? firstElement;
  ListElement<T>? lastElement;

  void add(T element) {
    ListElement<T> listElement = ListElement(element);
    if(firstElement == null && lastElement == null) {
      firstElement = listElement;
      lastElement = listElement;
      return;
    }
    lastElement!.nextElement = listElement;
    lastElement = listElement;
  }

  @override
  Iterator<T> iterator() {
    return LinkedListIterator(firstElement);
  }
}

class LinkedListIterator<T> implements Iterator<T> {
  ListElement<T>? currentElement;

  LinkedListIterator(this.currentElement);

  @override
  T? get() {
    ListElement<T>? returnElement = currentElement;
    currentElement = currentElement?.nextElement;
    return returnElement?.data;
  }

  @override
  bool hasNext() {
    return currentElement != null;
  }
}