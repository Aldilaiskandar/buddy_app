import 'package:flutter/material.dart';

class CustomGradient{
  Gradient generateCyanToTeal(){
    return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[Colors.cyan, Colors.tealAccent[100]]
    );
  }
}