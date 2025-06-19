// lib/core/services/local_storage_service.dart

abstract class LocalStorageService<T> {
  Future<void> save(String key, T value);
  Future<void> delete(String key);
  Future<T?> get(String key);
  Future<List<T>> getAll();
  Future<void> clear();
}
