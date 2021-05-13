import 'package:flutter/material.dart';

import '../constants.dart';
class BottomNavigationButton extends StatelessWidget {

  BottomNavigationButton({@required this.buttonTitle,@required this.onTap});

  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(///bottom navigation bar
        child: Center(child: Text(buttonTitle,style: kCalculateButtonStyle,)),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}