import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));
  void increment(int value) =>
      emit(CounterState(counterValue: state.counterValue + value));
  void decrement(int value) =>
      emit(CounterState(counterValue: state.counterValue - value));
}
