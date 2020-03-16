import 'package:buddy_app/bloc/dashboard/daily/daily_bloc.dart';
import 'package:buddy_app/bloc/dashboard/monthly/monthly_bloc.dart';
import 'package:buddy_app/bloc/dashboard/purchase_form/purchase_form_bloc.dart';
import 'package:buddy_app/bloc/dashboard/recent/recent_bloc.dart';
import 'package:buddy_app/common/constant/ui_constant.dart';
import 'package:buddy_app/common/utils/date_utils.dart';
import 'package:buddy_app/models/spend_model.dart';
import 'package:buddy_app/presentation/widget/custom_gradient.dart';
import 'package:buddy_app/presentation/widget/header_container.dart';
import 'package:buddy_app/presentation/widget/loading_widget.dart';
import 'package:buddy_app/presentation/widget/progress_widget.dart';
import 'package:buddy_app/presentation/widget/purchase_form.dart';
import 'package:buddy_app/presentation/widget/recent_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DashboardScreen extends StatelessWidget {
  final List<Spend> _dummySpends = [
    Spend(description: 'Beli Bakso', cost: 15000),
    Spend(description: 'Beli Kemeja', cost: 100000),
    Spend(description: 'Bayarin Pacar Makan', cost: 50000),
    Spend(description: 'Beli es Buah', cost: 12000),
  ];
  PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    RecentBloc dashboardBloc = BlocProvider.of<RecentBloc>(context);
    MonthlyBloc monthlyBloc = BlocProvider.of<MonthlyBloc>(context);
    DailyBloc dailyBloc = BlocProvider.of<DailyBloc>(context);
    dashboardBloc.add(GetRecentEvent());
    return Scaffold(
        body: Stack(
      children: <Widget>[
        HeaderContainer(),
        BlocBuilder<RecentBloc, RecentState>(
          builder: (context, spendState) {
            if (spendState is RecentDataState) {
              return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: RecentWidget(spends: spendState.spends));
            } else {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Container(
                  height: 200,
                  child: buildProgressBar(),
                ),
              );
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 220),
          child: BlocBuilder<MonthlyBloc, MonthlyState>(
            builder: (context, monthlyState) {
              if (monthlyState is MonthlyData) {
                return ProgressWidget(
                  progressTitle: UIConstant.COST_PER_MONTH,
                  nominal: monthlyState.monthlyProgress,
                  showFunction: () => monthlyBloc.add(GetMonthlyProgress()),
                  hideFunction: () => monthlyBloc.add(HideMonthlyProgress()),
                );
              }
              return ProgressWidget(
                progressTitle: UIConstant.COST_PER_MONTH,
                nominal: UIConstant.HIDDEN,
                showFunction: () => monthlyBloc.add(GetMonthlyProgress()),
                hideFunction: () => monthlyBloc.add(HideMonthlyProgress()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 280),
          child: BlocBuilder<DailyBloc, DailyState>(
              builder: (context, dailyState) {
            if (dailyState is DailyLoadedState) {
              return ProgressWidget(
                progressTitle: UIConstant.COST_PER_DAY,
                nominal: dailyState.dailyProgress.toString(),
                showFunction: () => dailyBloc.add(GetDailyProgress()),
                hideFunction: () => dailyBloc.add(HideDailyProgress()),
              );
            }
            return ProgressWidget(
              progressTitle: UIConstant.COST_PER_DAY,
              nominal: UIConstant.HIDDEN,
              showFunction: () => dailyBloc.add(GetDailyProgress()),
              hideFunction: () => dailyBloc.add(HideDailyProgress()),
            );
          }),
        ),
        SlidingUpPanel(
          controller: _panelController,
          maxHeight: MediaQuery.of(context).size.height * 0.76,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          panel: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            UIConstant.CREATING_NEW_PURCHASE,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                wordSpacing: 4,
                                letterSpacing: 2),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          PurchaseForm(_panelController),
                        ],
                      ))
                ],
              )),
        )
      ],
    ));
  }
}
