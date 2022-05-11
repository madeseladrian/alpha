import 'package:faker/faker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class LocalStorageAdapter {
  final FlutterSecureStorage secureStorage;

  LocalStorageAdapter({required this.secureStorage});
  
  Future<String?> fetchSecure(String key) async {
    return await secureStorage.read(key: key);
  }
}

class FlutterSecureStorageSpy extends Mock implements FlutterSecureStorage {}

void main() {
  late String key;
  late LocalStorageAdapter sut;
  late FlutterSecureStorageSpy secureStorage;

  When mockFetchCall() => when(() => secureStorage.read(key: any(named: 'key')));
  void mockFetch(String? data) => mockFetchCall().thenAnswer((_) async => data);

  setUp(() {
    key = faker.lorem.word();
    secureStorage = FlutterSecureStorageSpy();
    mockFetch(key);
    sut = LocalStorageAdapter(secureStorage: secureStorage);
  });

  test('1 - Should call save secure with correct value', () async {
    await sut.fetchSecure(key);
    verify(() => secureStorage.read(key: key));
  });
}