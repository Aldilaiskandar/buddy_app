import 'package:buddy_app/common/utils/date_utils.dart';
import 'package:buddy_app/models/spend_model.dart';
import 'package:flutter/material.dart';

class HistoryContainer extends StatelessWidget {
  final List<Spend> spends;


  HistoryContainer(this.spends);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListView.builder(
              itemCount: spends.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10 ),
                      title: Text(spends[index].description),
                      subtitle: Text(spends[index].createdAt),
                      trailing: Text(spends[index].cost.toString()),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}