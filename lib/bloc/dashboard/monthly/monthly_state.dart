part of 'monthly_bloc.dart';

@immutable
abstract class MonthlyState {}

class MonthlyInitial extends MonthlyState {}

class MonthlyData extends MonthlyState{
  final String monthlyProgress = '5.500.000';
}
class MonthlyHide extends MonthlyState{
  final String monthlyProgress = 'Hidden';

}