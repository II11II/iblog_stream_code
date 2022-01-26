part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}
class GetCounterEvent implements CounterEvent{}
class IncrementCounterEvent implements CounterEvent{
  final int incByNumber;

  const IncrementCounterEvent({
    required this.incByNumber,
  });
}
class DecrementCounterEvent implements CounterEvent{
  final int decByNumber;

  const DecrementCounterEvent({
    required this.decByNumber,
  });
}