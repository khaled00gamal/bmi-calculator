import 'package:bmi_calculator/calculateBMI.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../page components/BottomNavigationButton.dart';
import '../page components/BuildCard.dart';
import '../page components/IconContent.dart';
import '../page components/RoundIconButton.dart';
import '../constants.dart';
import 'resultsPage.dart';


enum Gender{male,female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height=180;
  int weight=30;
  int age=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(///male card
                  child: BuildCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                    myColor:selectedGender==Gender.male?
                    kActiveCardColor:kInactiveCardColor,
                    cardChild:IconContent(FontAwesomeIcons.mars,'MALE'),
                  ),
                ),
                Expanded(///female card
                  child: BuildCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    myColor:selectedGender==Gender.female?
                    kActiveCardColor:kInactiveCardColor,
                    cardChild:IconContent(FontAwesomeIcons.venus, 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(///slider card
            child:BuildCard(
                myColor:kActiveCardColor,
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kResultNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kResultNumberStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: kBottomContainerColor,
                        overlayColor: Color(0x29EB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: kMinHeight,
                        max: kMaxHeight,
                        activeColor: kBottomContainerColor,
                        inactiveColor: Colors.white,
                        onChanged: (double newValue){
                          setState(() {
                            height=newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(/// height and age inputs
              children: <Widget>[
                Expanded(
                  child: BuildCard(
                    myColor:kActiveCardColor,
                    cardChild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle,),
                        Text(weight.toString(),style: kResultNumberStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed:(){
                                setState(() {
                                  weight++;
                                  if(weight>100)weight=100;
                                });
                              },),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed:() {
                                setState(() {
                                  weight--;
                                  if(weight<0)weight=0;
                                });
                              },),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BuildCard(
                    myColor:kActiveCardColor,
                    cardChild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLabelTextStyle,),
                        Text(age.toString(), style: kResultNumberStyle,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                  if(age>100)age=100;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                  if(age<0)age=0;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationButton(buttonTitle: 'CALCULATE',onTap: (){
            BmiCalculator calculator= BmiCalculator(weight:weight,height: height);
            Navigator.push(context,MaterialPageRoute(builder: (context)=> ResultsPage(
              bmiResult: calculator.calculateBmi(),
              resultText: calculator.getResult(),
              advice: calculator.giveFinalAdvice(),
            )));
          },),

        ],
      ),
    );
  }
}





