import 'package:buddy_app/common/constant/ui_constant.dart';
import 'package:buddy_app/models/spend_model.dart';
import 'package:flutter/material.dart';

class RecentWidget extends StatelessWidget{
  final List<Spend> spends;

  const RecentWidget({Key key, this.spends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 210,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                UIConstant.LAST_TRANSACTION,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 1,
                color: Colors.grey,
              ),
              Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(itemCount: spends.length,
                  reverse: true,
                  itemBuilder: (context, index){
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(spends[index].description, style: TextStyle(fontWeight: FontWeight.w300),),
                      trailing: Text(spends[index].cost.toString()),
                    ),
                  );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}