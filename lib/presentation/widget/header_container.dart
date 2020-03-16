import 'package:buddy_app/presentation/widget/custom_gradient.dart';
import 'package:flutter/cupertino.dart';

class HeaderContainer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration:
      BoxDecoration(gradient: CustomGradient().generateCyanToTeal()),
    );
  }
}