part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final int number;

  const CounterState({
    required this.number,
  });
}

class CounterInitial extends CounterState {
  const CounterInitial(int number) : super(number: number);
}

class CounterLoading extends CounterState {
  const CounterLoading(int number) : super(number: number);
}

class CounterSuccess extends CounterState {
  const CounterSuccess(int number) : super(number: number);
}

class CounterError extends CounterState {
  final String errorMessage;
  const CounterError({required int number, required this.errorMessage}) : super(number: number);
}
