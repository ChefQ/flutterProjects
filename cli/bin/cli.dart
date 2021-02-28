import 'package:bloc/bloc.dart';
import 'package:cli/blocs/bloc.dart';
import 'package:cli/blocs/blocObserver.dart';
import 'package:cli/blocs/cubit.dart';
import 'package:cli/cli.dart';

Future<void> main(List<String> arguments) async {
  /* 
  print('Hello world: ${calculate()}!');
  Stream<int> stream = countStream(10);
  int sum = await sumStream(stream);
  print(sum);
  // using a subscription  
  final cubit = CounterCubit();
  final subscription = cubit.listen(print);
  cubit.increment(); // it cancels before it subscribes
  await Future.delayed(Duration(seconds: 4));
  cubit.increment();
  cubit.increment();
  await Future.delayed(Duration(seconds: 4));
  await subscription.cancel();
  await cubit.close(); // close a cubit when you're done.
  */

  //Using BlocObserver
  //Bloc.observer = SimpleBlocObserver();
  CounterBloc()..add(CounterEvent.increment);
  //..add(CounterEvent.decrement)
  // onChange doesn't respond to the same state.
  // onChange only responds to change in states
  // ..add(CounterEvent.decrement)
  // ..add(CounterEvent.decrement)
  // onChange
  // ..add(CounterEvent.increment);
}
