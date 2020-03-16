part of 'purchase_form_bloc.dart';

abstract class PurchaseFormState extends Equatable {
  const PurchaseFormState();
}

class PurchaseFormInitial extends PurchaseFormState {
  @override
  List<Object> get props => [];
}

class PurchaseFormSuccess extends PurchaseFormState{
  @override
  List<Object> get props {
    return [];
  }
}