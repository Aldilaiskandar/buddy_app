import 'package:buddy_app/bloc/dashboard/daily/daily_bloc.dart';
import 'package:buddy_app/bloc/dashboard/monthly/monthly_bloc.dart';
import 'package:buddy_app/bloc/dashboard/purchase_form/purchase_form_bloc.dart';
import 'package:buddy_app/bloc/dashboard/recent/recent_bloc.dart';
import 'package:buddy_app/common/routes/router.dart';
import 'package:buddy_app/resources/repository/spend_repository.dart';
import 'file:///E:/flutter/buddy_app/lib/presentation/screen/dashboard_screen.dart';
import 'file:///E:/flutter/buddy_app/lib/presentation/screen/history_screen.dart';
import 'file:///E:/flutter/buddy_app/lib/presentation/screen/home_screen.dart';
import 'file:///E:/flutter/buddy_app/lib/presentation/screen/profile_screen.dart';
import 'file:///E:/flutter/buddy_app/lib/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.initialPage:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.dashboardScreen:
        return MaterialPageRoute(builder: (_) => _buildDashboardScreen());
      case Routes.historyScreen:
        return MaterialPageRoute(builder: (_) => _buildHistoryScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => _buildProfileScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return _errorWidget();
    });
  }

  static Widget _buildDashboardScreen() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecentBloc>(create: (BuildContext context) => RecentBloc(SpendRepository.spendRepoFactory),),
        BlocProvider<MonthlyBloc>(create: (BuildContext context) => MonthlyBloc(),),
        BlocProvider<DailyBloc>(create: (BuildContext context) => DailyBloc(SpendRepository.spendRepoFactory)),
        BlocProvider<PurchaseFormBloc>(
            create: (BuildContext context) => PurchaseFormBloc())
      ],
      child: DashboardScreen(),
    );
  }

  static Widget _buildHistoryScreen() {
    return BlocProvider<RecentBloc>(
        create: (BuildContext context) => RecentBloc(SpendRepository.spendRepoFactory),
        child: HistoryScreen()
    );
  }

  static Widget _buildProfileScreen() {
    return ProfileScreen();
  }

  static Widget _errorWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR ROUTE'),
      ),
    );
  }

  static Widget getRouteWidget(String routePath) {
    switch (routePath) {
      case Routes.dashboardScreen:
        return _buildDashboardScreen();
      case Routes.historyScreen:
        return _buildHistoryScreen();
      case Routes.profileScreen:
        return _buildProfileScreen();
      default:
        return _errorWidget();
    }
  }
}
