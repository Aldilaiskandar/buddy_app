import 'package:buddy_app/bloc/dashboard/recent/recent_bloc.dart';
import 'file:///E:/flutter/buddy_app/lib/presentation/widget/header_container.dart';
import 'file:///E:/flutter/buddy_app/lib/presentation/widget/history_contaner.dart';
import 'package:buddy_app/presentation/widget/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RecentBloc>(context).add(GetRecentEvent());
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HeaderContainer(),
          BlocBuilder<RecentBloc, RecentState>(builder: (context, recentState){
            if(recentState is RecentDataState){
              return HistoryContainer(recentState.spends);
            }else{
              return Center(
                child: buildProgressBar(),
              );
            }
          })
        ],
      ),
    );
  }
}