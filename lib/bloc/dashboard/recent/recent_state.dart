part of 'recent_bloc.dart';

abstract class RecentState extends Equatable{
  const RecentState();
}

class RecentInitial extends RecentState {
  @override
  List<Object> get props {
    return [];
  }
}

class RecentDataState extends RecentState{
  final List<Spend> spends;

  RecentDataState(this.spends);

  @override
  List<Object> get props {
    return [spends];
  }
}

class RecentLoading extends RecentState{

  @override
  List<Object> get props {
    return [];
  }
}
