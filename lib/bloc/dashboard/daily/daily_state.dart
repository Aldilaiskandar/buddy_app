part of 'daily_bloc.dart';

abstract class DailyState extends Equatable {
  const DailyState();
}

class DailyHide extends DailyState {
  @override
  List<Object> get props => [];
}

class DailyLoadedState extends DailyState{
  final int dailyProgress;

  DailyLoadedState(this.dailyProgress);
  @override
  List<Object> get props {
    return [dailyProgress];
  }
}

class DailyHiddenState extends DailyState{
  final String dailyProgress = 'Hidden';

  @override
  List<Object> get props {
    return [dailyProgress];
  }
}
