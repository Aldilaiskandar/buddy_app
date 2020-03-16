import 'package:buddy_app/presentation/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Home screen', (){
    testWidgets('home screen should have 1 bottomNavigationBar', (WidgetTester tester)async{
      await tester.pumpWidget(MaterialApp(home: HomeScreen(),));
      final bottomNavigationBar = find.byType(BottomNavigationBar);
      expect(bottomNavigationBar, findsOneWidget);
    });
    testWidgets('home screen should have 3 bottomNavigationItem', (WidgetTester tester)async{
      await tester.pumpWidget(MaterialApp(home: HomeScreen(),));
      final bottomNavigationBar = find.byType(BottomNavigationBar).evaluate().single.widget as BottomNavigationBar;
      final countItem = bottomNavigationBar.items.length;
      expect(countItem, 3);
    });
  });
}