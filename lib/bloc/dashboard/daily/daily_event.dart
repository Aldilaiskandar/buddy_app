part of 'daily_bloc.dart';

abstract class DailyEvent extends Equatable {
  const DailyEvent();
}

class GetDailyProgress extends DailyEvent{
  @override
  List<Object> get props {
    return [];
  }
}

class HideDailyProgress extends DailyEvent{
  @override
  List<Object> get props {
    return [];
  }
}