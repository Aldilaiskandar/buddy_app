import 'package:bloc_test/bloc_test.dart';
import 'package:buddy_app/bloc/dashboard/daily/daily_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'mock/mock_spend_repository.dart';
import 'package:mockito/mockito.dart';

void main() {
  MockSpendRepository mockSpendRepository;
  setUp(() {
    mockSpendRepository = MockSpendRepository();
  });

  group('Daily BLoC testing', () {
    final int expectDailyProgress = 100000;
    blocTest('Initiate state',
        build: () async => DailyBloc(mockSpendRepository), expect: []);
    blocTest(
      'get daily recent data',
      build: () async {
        when(mockSpendRepository.sumSpends()).thenAnswer(
            (realInvocation) async => Future<int>.value(expectDailyProgress));
        return DailyBloc(mockSpendRepository);
      },
      act: (DailyBloc dailyBloc) async => dailyBloc.add(GetDailyProgress()),
      expect: [DailyLoadedState(expectDailyProgress)],
    );
  });
}
