import 'package:buddy_app/common/routes/route_generator.dart';
import 'package:buddy_app/common/routes/router.dart';
import 'package:buddy_app/presentation/widget/custom_gradient.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _title;
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = [
    RouteGenerator.getRouteWidget(Routes.dashboardScreen),
    RouteGenerator.getRouteWidget(Routes.historyScreen),
    RouteGenerator.getRouteWidget(Routes.profileScreen),
  ];

  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        switch (index) {
          case 0:
            _title = 'Dashboard';
            break;
          case 1:
            _title = 'History';
            break;
          case 2:
            _title = 'Your Profile';
            break;
          default:
            _title = 'demo_app';
        }
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottomBar = BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.cyan,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text(''),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(_title ?? 'Dashboard'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: CustomGradient().generateCyanToTeal()
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: bottomBar,
    );
  }
}
