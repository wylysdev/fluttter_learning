import 'dart:async';

class HomeBloc {
  final _controller = StreamController<int>.broadcast();
  Sink<int> get input => _controller.sink;
  Stream<String> get output => _controller.stream.map((event) => "$event");

  dispose(){
    _controller.close();
  }

}
