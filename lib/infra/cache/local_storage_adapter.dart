import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageAdapter {
  final FlutterSecureStorage secureStorage;

  LocalStorageAdapter({required this.secureStorage});
  
  Future<String?> fetchSecure(String key) async {
    return await secureStorage.read(key: key);
  }
}