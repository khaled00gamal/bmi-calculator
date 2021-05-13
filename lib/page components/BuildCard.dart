import 'package:flutter/material.dart';


class BuildCard extends StatelessWidget{
  BuildCard({this.myColor,this.cardChild,this.onPress});
  final Color myColor;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: myColor,
        ),
      ),
    );
  }
}

