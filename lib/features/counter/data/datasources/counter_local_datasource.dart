abstract class ICounterLocalDataSource {
  Future<int> getCount();

  Future<void> updateCount(int counter);
}

class CounterLocalDataSource implements ICounterLocalDataSource {
  int number = 100;

  @override
  Future<int> getCount() {
    return Future.value(number);
  }

  @override
  Future<void> updateCount(int counter) async {
    number = counter;
    return;
  }
}
