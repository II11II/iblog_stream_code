abstract class ICounterRemoteDataSource {
  Future<int> getCount();

  Future<void> updateCount(int counter);
}

class CounterRemoteDataSource implements ICounterRemoteDataSource {
  int _counterApi = -200;

  @override
  Future<int> getCount() {
    return Future.value(_counterApi);
  }

  @override
  Future<void> updateCount(int counter) async {
    _counterApi = counter;
    return;
  }
}
