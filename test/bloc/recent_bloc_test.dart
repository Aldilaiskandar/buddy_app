import 'package:bloc_test/bloc_test.dart';
import 'package:buddy_app/bloc/dashboard/recent/recent_bloc.dart';
import 'package:buddy_app/models/spend_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock/mock_spend_repository.dart';

void main() {
  MockSpendRepository mockSpendRepository;
  setUp(() {
    mockSpendRepository = MockSpendRepository();
  });
  group('Recent BLoC Test', () {
    final List<Spend> spends = [
      Spend(description: 'beli bakso', cost: 10000),
      Spend(description: 'beli bensin', cost: 15000),
    ];
    blocTest('Initial state', build: () async {
      print('masuk?');
      return RecentBloc(mockSpendRepository);
    }, expect: []);

    blocTest('GetAllData',
        build: () async {
          when(mockSpendRepository.getAllSpend())
              .thenAnswer((_) async => Future<List<Spend>>.value(spends));
          return RecentBloc(mockSpendRepository);
        },
        act: (RecentBloc bloc) async => bloc.add(GetRecentEvent()),
        expect: [RecentDataState(spends)]);

    blocTest('Delete All Recent Data',
        build: () async {
          when(mockSpendRepository.getAllSpend())
              .thenAnswer((_) async => Future<List<Spend>>.value(spends));
          return RecentBloc(mockSpendRepository);
        },
        act: (RecentBloc bloc) async {
          bloc.add(GetRecentEvent());
          bloc.add(DeleteAllRecent());
        },
        expect: [RecentDataState(spends)],
        verify: (_) async => verify(mockSpendRepository.deleteAll()).called(1)
        );
  });
}
