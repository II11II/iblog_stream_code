abstract class ICounterRepository {
  Stream<int> getCount();
  Future<void> updateCount(int counter);
}
