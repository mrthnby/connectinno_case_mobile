abstract class LocalDatabaseClient {
  Future<int> save<T>(T object);
  Future<T?> getById<T>(int id);
  Future<List<T>> getAll<T>();
  Future<bool> delete<T>(int id);
  Future<void> clear<T>();
}
