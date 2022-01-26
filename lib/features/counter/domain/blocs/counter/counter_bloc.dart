import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:iblogs_roadmap/core/failures.dart';
import 'package:iblogs_roadmap/features/counter/domain/repositories/i_counter_repository.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final ICounterRepository _counterRepository;

  CounterBloc({required ICounterRepository counterRepository})
      : _counterRepository = counterRepository,
        super(const CounterInitial(0)) {
    on<GetCounterEvent>(_getNumber,transformer: restartable(), );
    on<IncrementCounterEvent>(_incrementNumber,transformer: restartable(), );
    on<DecrementCounterEvent>(_decrementNumber,transformer: restartable(), );
  }

  FutureOr<void> _getNumber(GetCounterEvent event, Emitter<CounterState> emit) async {
    emit(CounterLoading(state.number));

  await  emit.forEach(_counterRepository.getCount(), onData: (int number) => CounterSuccess(number), onError: (error, stackTrace) {
      if (error is LocalFailure) {
        return CounterError(number: state.number, errorMessage: error.message);
      } else if (error is ServerFailure) {
        return CounterError(number: state.number, errorMessage: error.message);
      } else {
        return CounterError(number: state.number, errorMessage: 'Nomalum xato');
      }
    });
  }

  FutureOr<void> _incrementNumber(IncrementCounterEvent event, Emitter<CounterState> emit) async {
    final finalNumber = event.incByNumber + state.number;
    emit(CounterLoading(finalNumber));
    try {
      _counterRepository.updateCount(finalNumber);
      await Future.delayed(const Duration(seconds: 1));
      emit(CounterSuccess(finalNumber));
    } on LocalFailure catch (error, stackTrace) {
      emit(CounterError(number: finalNumber, errorMessage: error.message));
      rethrow;
    } on ServerFailure catch (error, stackTrace) {
      emit(CounterError(number: finalNumber, errorMessage: error.message));
      rethrow;
    } catch (e, stackTrace) {
      emit(CounterError(number: finalNumber, errorMessage: 'Nomalum xato'));
      rethrow;
    }
  }

  FutureOr<void> _decrementNumber(DecrementCounterEvent event, Emitter<CounterState> emit) async {
    final finalNumber = state.number - event.decByNumber;
    emit(CounterLoading(finalNumber));
    try {
      _counterRepository.updateCount(finalNumber);
      await Future.delayed(const Duration(seconds: 1));
      emit(CounterSuccess(finalNumber));
    } on LocalFailure catch (error, stackTrace) {
      emit(CounterError(number: finalNumber, errorMessage: error.message));
      rethrow;
    } on ServerFailure catch (error, stackTrace) {
      emit(CounterError(number: finalNumber, errorMessage: error.message));
      rethrow;
    } catch (e, stackTrace) {
      emit(CounterError(number: finalNumber, errorMessage: 'Nomalum xato'));
      rethrow;
    }
  }
}
