import 'dart:async';
import 'dart:math';

class RandomNumberBloc {
  final _randomNumberController = StreamController<int>();
  Stream<int> get randomNumberStream => _randomNumberController.stream;
  Sink<int> get randomNumberSink => _randomNumberController.sink;

  void generateRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    randomNumberSink.add(myNum);
  }

  void dispose() {
    _randomNumberController.close();
  }
}