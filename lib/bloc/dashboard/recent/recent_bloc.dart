import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:buddy_app/models/spend_model.dart';
import 'package:buddy_app/resources/repository/spend_repository.dart';
import 'package:equatable/equatable.dart';

part 'recent_event.dart';

part 'recent_state.dart';

class RecentBloc extends Bloc<RecentEvent, RecentState> {
  SpendRepository spendRepository;

  RecentBloc(this.spendRepository);

  @override
  RecentState get initialState => RecentInitial();

  @override
  Stream<RecentState> mapEventToState(RecentEvent event,) async* {
    if (event is GetRecentEvent) {
      List<Spend> spends;
      await spendRepository.getAllSpend().then((value) => spends = value);
      yield RecentDataState(spends);
    } else if (event is DeleteAllRecent) {
      await spendRepository.deleteAll();
      yield state;
    } else {
      RecentLoading();
    }
  }
}
