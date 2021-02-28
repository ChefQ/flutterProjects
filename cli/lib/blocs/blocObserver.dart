import 'package:bloc/bloc.dart';

// listens to any BlocObserver change
class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    print(bloc);
    super.onEvent(bloc, event);
  }

  //sing for me, please
  @override
  void onCreate(Cubit cubit) {
    print("We're almost there!");
  }
}
