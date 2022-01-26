import 'package:iblogs_roadmap/features/counter/data/datasources/counter_local_datasource.dart';
import 'package:iblogs_roadmap/features/counter/data/datasources/counter_remote_datasource.dart';
import 'package:iblogs_roadmap/features/counter/domain/repositories/i_counter_repository.dart';

class CounterRepository implements ICounterRepository {
  final CounterLocalDataSource _localDataSource;
  final CounterRemoteDataSource _remoteDataSource;

  const CounterRepository({
    required CounterLocalDataSource localDataSource,
    required CounterRemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  @override
  Stream<int> getCount() async* {
    yield await _localDataSource.getCount();
    await Future.delayed(const Duration(seconds: 1));
    yield await _remoteDataSource.getCount();
  }

  @override
  Future<void> updateCount(int counter) async {
    _localDataSource.updateCount(counter);
    _remoteDataSource.updateCount(counter);
  }
}