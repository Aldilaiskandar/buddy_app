import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'common/routes/route_generator.dart';
import 'common/routes/router.dart';

void main()=> runApp(BuddyApp());

class BuddyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Buddy',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: Routes.initialPage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }

}