import 'dart:async';

import 'package:buddy_app/bloc/dashboard/daily/daily_bloc.dart';
import 'package:buddy_app/bloc/dashboard/purchase_form/purchase_form_bloc.dart';
import 'package:buddy_app/bloc/dashboard/recent/recent_bloc.dart';
import 'package:buddy_app/common/utils/date_utils.dart';
import 'package:buddy_app/models/spend_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PurchaseForm extends StatelessWidget {
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _costController = TextEditingController();
  PanelController panelController = PanelController();

  PurchaseForm(this.panelController);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            child: TextFormField(
              controller: _descriptionController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 2,
            ),
          ),
          Container(
            height: 60,
            child: TextFormField(
              controller: _costController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'How Much?', prefix: Text('Rp. ')),
              maxLines: 1,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            color: Colors.cyan,
            splashColor: Colors.tealAccent,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            onPressed: () {
              Spend spend = Spend(description: _descriptionController.text, cost: int.parse(_costController.text));
              BlocProvider.of<PurchaseFormBloc>(context).add(SubmitFormEvent(spend: spend));
              BlocProvider.of<RecentBloc>(context).add(GetRecentEvent());
              BlocProvider.of<DailyBloc>(context).add(GetDailyProgress());
              _descriptionController.clear();
              _costController.clear();
              panelController.close();
            },
            child: Text('Save', style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}
