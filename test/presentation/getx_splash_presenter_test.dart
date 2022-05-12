import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:alpha/domain/entities/entities.dart';
import 'package:alpha/domain/usecases/usecases.dart';

class GetxSplashPresenter {
  final LoadCurrentAccount loadCurrentAccount;

  GetxSplashPresenter({required this.loadCurrentAccount});

  final _navigateTo = Rx<String?>(null);

  Stream<String?> get navigateToStream => _navigateTo.stream;

  Future<void> checkAccount({int durationInSeconds = 2}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));
    try {
      await loadCurrentAccount.load();
      _navigateTo.value = '/initial';
    } catch (error) {
      
    }
  }
}

class LoadCurrentAccountSpy extends Mock implements LoadCurrentAccount {}

void main() {
  late GetxSplashPresenter sut;
  late LoadCurrentAccountSpy loadCurrentAccount;
  late AccountEntity account;

  When mockLoadCall() => when(() => loadCurrentAccount.load());
  void mockLoad({required AccountEntity account}) => 
    mockLoadCall().thenAnswer((_) async => account);
  
  AccountEntity makeAccount() => AccountEntity(token: faker.guid.guid());

  setUp(() {
    account = makeAccount();
    loadCurrentAccount = LoadCurrentAccountSpy();
    mockLoad(account: account);
    sut = GetxSplashPresenter(loadCurrentAccount: loadCurrentAccount);
  });

  setUpAll(() {
    makeAccount();
  });
 
  test('1 - Should call LoadCurrentAccount', () async {
    await sut.checkAccount(durationInSeconds: 0);
    verify(() => loadCurrentAccount.load()).called(1);
  });
  
  test('2 - Should go to initial page on success', () async {
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/initial')));

    await sut.checkAccount(durationInSeconds: 0);
  });
}