import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

import 'package:alpha/ui/pages/pages.dart';

class SplashPresenterSpy extends Mock implements SplashPresenter {}

void main() {
  late SplashPresenterSpy presenter;
  late StreamController<String?> navigateToController;

  Future<void> _testSplashPage(WidgetTester tester) async { 
    presenter = SplashPresenterSpy();
    navigateToController = StreamController<String?>();

    when(() => presenter.checkAccount()).thenAnswer((_) async => _);
    when(() => presenter.navigateToStream).thenAnswer((_) => navigateToController.stream);

    final splashPage = GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashPage(presenter: presenter)),
        GetPage(name: '/any_route', page: () => const Scaffold(body: Text('fake page')))
      ]  
    );
    await tester.pumpWidget(splashPage);
  }

  tearDown(() {
    navigateToController.close();
  });

  setUp(() {
    presenter = SplashPresenterSpy();
  });

  testWidgets('1 - Should call loadCurrentAccount on page load', (WidgetTester tester) async {
    await _testSplashPage(tester);

    verify(() => presenter.checkAccount()).called(1);
  });

  testWidgets('2 - Should change page', (WidgetTester tester) async {
    await _testSplashPage(tester);

    navigateToController.add('/any_route');
    await tester.pumpAndSettle();

    expect(Get.currentRoute, '/any_route');
    expect(find.text('fake page'), findsOneWidget);
  });

  testWidgets('3 - Should not change page', (WidgetTester tester) async {
    await _testSplashPage(tester);

    navigateToController.add('');
    await tester.pumpAndSettle();
    expect(Get.currentRoute, '/');

    navigateToController.add(null);
    await tester.pumpAndSettle();
    expect(Get.currentRoute, '/');
  });
}