import 'dart:collection';

class LimitedQueue<E> {
  final int _maxLength;
  final Queue<E> _queue = Queue<E>();

  LimitedQueue(this._maxLength);

  void add(E element) {
    if (_queue.length >= _maxLength) {
      _queue.removeFirst(); // Rimuove il primo elemento quando si raggiunge la lunghezza massima
    }
    _queue.add(element); // Aggiunge il nuovo elemento
  }

  List<E> getAsList() {
    return _queue.toList(); // Restituisce la lista di elementi
  }
}