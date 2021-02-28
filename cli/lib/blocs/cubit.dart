import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);

  // using an observer
  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  void error() {
    emit(0);
    addError(Exception('increment error!'), StackTrace.current);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print("error: " + error.toString());
    print("stackTrace:  " + stackTrace.toString());

    super.onError(error, stackTrace);
  }
}
