import 'dart:async';

// This is BLoC
class EventBus {
  final bus = StreamController<Event>.broadcast();

  Stream<Event> get exit => bus.stream;
  StreamSink<Event> get entrance => bus.sink;

  void dispose() {
    bus.close();
  }
}

abstract class Event {}
