import 'package:bloc/bloc.dart';

int calculate() {
  return 6 * 7;
}

Stream<int> countStream(int max) async* {
  for (var i = 0; i < max; i++) {
    yield i;
  }
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (int value in stream) {
    sum += value;
  }
  return sum;
}
