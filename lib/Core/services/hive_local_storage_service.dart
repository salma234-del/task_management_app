// lib/core/services/hive_storage_service.dart

import 'package:hive/hive.dart';
import 'local_storage_service.dart';

class HiveStorageService<T> implements LocalStorageService<T> {
  final String boxName;

  HiveStorageService(this.boxName);

  Future<Box<T>> _openBox() async {
    return await Hive.openBox<T>(boxName);
  }

  @override
  Future<void> save(String key, T value) async {
    final box = await _openBox();
    await box.put(key, value);
  }

  @override
  Future<void> delete(String key) async {
    final box = await _openBox();
    await box.delete(key);
  }

  @override
  Future<T?> get(String key) async {
    final box = await _openBox();
    return box.get(key);
  }

  @override
  Future<List<T>> getAll() async {
    final box = await _openBox();
    return box.values.toList();
  }

  @override
  Future<void> clear() async {
    final box = await _openBox();
    await box.clear();
  }
}
