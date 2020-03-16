part of 'monthly_bloc.dart';

@immutable
abstract class MonthlyEvent extends Equatable{}

class GetMonthlyProgress extends MonthlyEvent{

  @override
  List<Object> get props {
    return [];
  }
}

class HideMonthlyProgress extends MonthlyEvent{
  @override
  List<Object> get props {
    return [];
  }
}
