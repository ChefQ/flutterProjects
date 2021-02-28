import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, String> {
  //Counterbloc         the super state must be set
  CounterBloc() : super('None');

  @override
  Stream<String> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield 'up';
        break;
      case CounterEvent.decrement:
        yield 'down';
    }
  }

  @override
  void onChange(Change<String> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onEvent(CounterEvent event) {
    print(event);
    super.onEvent(event);
  }

  @override
  void onTransition(Transition<CounterEvent, String> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
