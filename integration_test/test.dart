import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dime_a_dinner/flutter_flow/flutter_flow_icon_button.dart';
import 'package:dime_a_dinner/flutter_flow/flutter_flow_widgets.dart';
import 'package:dime_a_dinner/flutter_flow/flutter_flow_theme.dart';
import 'package:dime_a_dinner/index.dart';
import 'package:dime_a_dinner/main.dart';
import 'package:dime_a_dinner/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:dime_a_dinner/backend/firebase/firebase_config.dart';
import 'package:dime_a_dinner/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('US2 testing', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: StartWidget(),
      ),
    ));

    await tester.pumpAndSettle(
      Duration(milliseconds: 10000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 13000),
    );
    await tester.tap(find.byKey(ValueKey('GoLoginBtn_cnb8')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 7000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 10000),
    );
    await tester.enterText(
        find.byKey(ValueKey('LoginEmailTxt_1sc0')), 'tester@gmail.com');
    await tester.enterText(
        find.byKey(ValueKey('LoginPassTxt_sxlq')), '123456789');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.tap(find.byKey(ValueKey('LoginBtn_kww7')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 8000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 10000),
    );
  }, skip: true);

  testWidgets('US 6 testing', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: StartWidget(),
      ),
    ));

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey('GoLoginBtn_cnb8')));
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(ValueKey('LoginEmailTxt_1sc0')), 'tester@gmail.com');
    await tester.enterText(
        find.byKey(ValueKey('LoginPassTxt_sxlq')), '123456789');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.tap(find.byKey(ValueKey('LoginBtn_kww7')));
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(ValueKey('FeedbackTxt_odqd')), 'Hello World');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.tap(find.byKey(ValueKey('SubmitBtn_ipv1')));
    await tester.pumpAndSettle();
    expect(find.byKey(ValueKey('Container_svdu')), findsOneWidget);
  }, skip: true);

  testWidgets('US3 ', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'tester@gmail.com', password: '123456789');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: UserRecipiesWidget(),
      ),
    ));

    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(ValueKey('searchBar_0qom')), 'tomato');
    await tester.tap(find.byKey(ValueKey('Search_6q6c')));
    await tester.pumpAndSettle();
    expect(find.byKey(ValueKey('ListView_de6d')), findsWidgets);
  }, skip: true);

  testWidgets('US7', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'tester@gmail.com', password: '123456789');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: UserRecipiesWidget(),
      ),
    ));

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey('filters_ixlf')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey('Button_nye9')));
    await tester.tap(find.byKey(ValueKey('Button_kdgz')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(ValueKey('searchBar_0qom')), 'chicken');
    await tester.tap(find.byKey(ValueKey('Search_6q6c')));
    await tester.pumpAndSettle();
    expect(find.byKey(ValueKey('Column_5zkw')), findsNothing);
  }, skip: true);

  testWidgets('US4', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'jen.day@uri.edu', password: 'test123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: UserListsWidget(),
      ),
    ));

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey('IconButton_1j17')));
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsWidgets);
    await tester.enterText(find.byType(TextField), 'Apple');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.tap(find.text('Add to Grocery List'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey('move_h116')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey('PantryListTab_686m')));
    await tester.pumpAndSettle();
    expect(find.byKey(ValueKey('Row_pywu')), findsWidgets);
    await tester.tap(find.byKey(ValueKey('move_gu3l')));
    await tester.tap(find.byKey(ValueKey('ShoppingListTab_dta3')));
    await tester.pumpAndSettle();
    expect(find.byKey(ValueKey('Row_pdoy')), findsWidgets);
    await tester.tap(find.byKey(ValueKey('Delete_pn2m')));
    expect(find.byKey(ValueKey('Row_pdoy')), findsNothing);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
