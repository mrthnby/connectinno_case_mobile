import 'package:connectinno_case_mobile/core/clients/db/local_db_client.dart';
import 'package:connectinno_case_mobile/core/error/exceptions.dart';
import 'package:connectinno_case_mobile/gen/objectbox.g.dart'; // created by `flutter pub run build_runner build`
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

@Singleton(as: LocalDatabaseClient)
final class LocalDatabaseClientImpl implements LocalDatabaseClient {
  LocalDatabaseClientImpl(this.objectBox);

  final ObjectBox objectBox;

  @override
  Future<void> clear<T>() async {
    try {
      objectBox.store.box<T>().removeAll();
    } catch (e) {
      throw LocalDatabaseException(message: 'Error clearing database: $e');
    }
  }

  @override
  Future<bool> delete<T>(int id) async {
    try {
      return objectBox.store.box<T>().remove(id);
    } catch (e) {
      throw LocalDatabaseException(message: 'Error deleting object: $e');
    }
  }

  @override
  Future<List<T>> getAll<T>() async {
    try {
      return objectBox.store.box<T>().getAll();
    } catch (e) {
      throw LocalDatabaseException(message: 'Error getting all objects: $e');
    }
  }

  @override
  Future<T?> getById<T>(int id) async {
    try {
      return objectBox.store.box<T>().get(id);
    } catch (e) {
      throw LocalDatabaseException(message: 'Error getting object by id: $e');
    }
  }

  @override
  Future<int> save<T>(T object) async {
    try {
      return objectBox.store.box<T>().put(object);
    } catch (e) {
      throw LocalDatabaseException(message: 'Error saving object: $e');
    }
  }
}

final class ObjectBox {
  ObjectBox._create(this.store);

  /// The Store of this app.
  late final Store store;

  /// The Store name
  static const _storeName = 'connectinno-case-db';

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    try {
      final docsDir = await getApplicationDocumentsDirectory();
      final store = await openStore(
        directory: path.join(docsDir.path, _storeName),
      );
      return ObjectBox._create(store);
    } catch (e) {
      throw LocalDatabaseException(message: 'Error creating object box: $e');
    }
  }
}
