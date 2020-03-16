import 'dart:async';

import 'package:buddy_app/common/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, () {
      Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Colors.cyan, Colors.tealAccent[100]])),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: SvgPicture.asset(
                'assets/images/buddy.svg',
                width: 150,
              ),
            ),
            Container(
              child: Text(
                'Buddy',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              key: Key('splash_sizedBox_givenArea'),
              height: 5,
            ),
            Container(child: Text('Your Assistant')),
          ],
        )),
      ),
    );
  }
}
