import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:buddy_app/resources/repository/spend_repository.dart';
import 'package:equatable/equatable.dart';

part 'daily_event.dart';
part 'daily_state.dart';

class DailyBloc extends Bloc<DailyEvent, DailyState> {
  SpendRepository spendRepository;

  DailyBloc(this.spendRepository);

  @override
  DailyState get initialState => DailyHiddenState();

  @override
  Stream<DailyState> mapEventToState(DailyEvent event,) async* {
    if(event==GetDailyProgress()){
      int result = await spendRepository.sumSpends();
      yield DailyLoadedState(result);
    }else{
      yield DailyHide();
    }
  }
}
