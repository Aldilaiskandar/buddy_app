import 'package:flutter_test/flutter_test.dart';

void main() {
  int tearDownCount = 1;
  int tearDownAllCount = 1;
  int setUpCount = 1;
  int setUpAllCount = 1;

  tearDownAll(() {
    print('tearDownAll Called $tearDownAllCount');
    tearDownAllCount++;
  });
  setUpAll(() async {
    print('setUpAll Called $setUpAllCount');
    setUpAllCount++;
  });
  test('outside group', () {
    print('test outside group');
  });

  group('Try SetUp and tearDown', () {
    tearDown(() {
      print('tearDown Called $tearDownCount');
      tearDownCount++;
    });

    setUp(() {
      print('setUp Called $setUpCount');
      setUpCount++;
    });
    test(
        'you can name this test with clear description of your test can be event or some component',
        () {
      // TODO: do some test here!
      print('inside test1');
      expect('1', '1');
    });
    test('second Test', () {
      // TODO: same here
      print('inside test2');
    });
  });




  group('group test 2', () {
    setUpAll(() async {
      print('setUpAll IN GRUP TEST $setUpAllCount');
      setUpAllCount++;
    });

    setUp(() {
      print('setUp grupTest2');
    });
    test('test1', () {
      print('masuk test1');
    });
    test('test2', () {
      print('masuk test2');
    });
  });
}
