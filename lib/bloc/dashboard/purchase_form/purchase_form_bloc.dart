import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:buddy_app/common/utils/date_utils.dart';
import 'package:buddy_app/models/spend_model.dart';
import 'package:buddy_app/resources/repository/spend_repository.dart';
import 'package:equatable/equatable.dart';

part 'purchase_form_event.dart';
part 'purchase_form_state.dart';

class PurchaseFormBloc extends Bloc<PurchaseFormEvent, PurchaseFormState> {
  @override
  PurchaseFormState get initialState => PurchaseFormInitial();

  @override
  Stream<PurchaseFormState> mapEventToState(PurchaseFormEvent event,) async* {
    if(event is SubmitFormEvent){
      SpendRepository().addSpend(event.spend);
      yield PurchaseFormSuccess();
    }
  }
}
