import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/cache/cache.dart';

class LocalStorageAdapter implements FetchSecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  LocalStorageAdapter({required this.secureStorage});
  
  @override
  Future<String?> fetchSecure(String key) async {
    return await secureStorage.read(key: key);
  }
}