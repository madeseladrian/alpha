import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

import 'package:alpha/ui/pages/pages.dart';

class SplashPresenterSpy extends Mock implements SplashPresenter {}

void main() {
  late SplashPresenterSpy presenter;

  Future<void> _testSplashPage(WidgetTester tester) async { 
    presenter = SplashPresenterSpy();

    when(() => presenter.checkAccount()).thenAnswer((_) async => _);

    final splashPage = GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashPage(presenter: presenter)),
      ]  
    );
    await tester.pumpWidget(splashPage);
  }

  setUp(() {
    presenter = SplashPresenterSpy();
  });

  testWidgets('1 - Should call loadCurrentAccount on page load', (WidgetTester tester) async {
    await _testSplashPage(tester);

    verify(() => presenter.checkAccount()).called(1);
  });
}