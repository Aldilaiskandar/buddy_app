part of 'recent_bloc.dart';

abstract class RecentEvent extends Equatable{
  const RecentEvent();
}
class GetRecentEvent extends RecentEvent {

  @override
  List<Object> get props {
    return [];
  }
}