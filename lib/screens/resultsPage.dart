import 'package:bmi_calculator/page%20components/BottomNavigationButton.dart';
import 'package:bmi_calculator/page%20components/BuildCard.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult,@required this.resultText,@required this.advice});
  final String bmiResult;
  final String resultText;
  final String advice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',style: kResultsLabelStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: BuildCard(myColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),style: kResultTypeStyle,),
                  Text(bmiResult.toUpperCase(),style: kBmiResultStyle,),
                  Text(advice.toUpperCase(),style: kFinalResultAdvice,textAlign: TextAlign.center,),
                ],
              ),),
          ),
          Expanded(
            child: BottomNavigationButton(buttonTitle:'RE-CALCULATE',onTap: (){
              Navigator.pop(context);
            },
            ),
          ),
        ],
      ),
    );
  }
}
