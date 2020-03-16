part of 'purchase_form_bloc.dart';

abstract class PurchaseFormEvent extends Equatable {
  const PurchaseFormEvent();
}

class SubmitFormEvent extends PurchaseFormEvent{
  final Spend spend;
  SubmitFormEvent({this.spend});

  @override
  List<Object> get props {
    return [];
  }
}