import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final box = GetStorage();

  saveData(String key, dynamic value) => box.write(key, value);

  getData(String key) => box.read(key);

  Future<void> clearStorage() => box.erase();
}

