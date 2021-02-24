import 'dart:async';

//Providers and streams are usually kept private to the producer
class Streams {
  // ignore: close_sinks
  final _controller = StreamController<dynamic>.broadcast();
  // create the stream
  Stream<dynamic> get onNewData => _controller.stream;

  // used the sink in the StreamController
  void addData(dynamic value) {
    _controller.add(value);
  }

  void dispose() {
    _controller.close();
  }
}
