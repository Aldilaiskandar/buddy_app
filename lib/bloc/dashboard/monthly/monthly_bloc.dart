import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'monthly_event.dart';
part 'monthly_state.dart';

class MonthlyBloc extends Bloc<MonthlyEvent, MonthlyState> {
  @override
  MonthlyState get initialState => MonthlyHide();

  @override
  Stream<MonthlyState> mapEventToState(MonthlyEvent event,) async* {
    yield (event==GetMonthlyProgress())?MonthlyData():MonthlyHide();
  }
}
