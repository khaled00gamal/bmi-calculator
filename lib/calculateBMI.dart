import 'dart:math';
class BmiCalculator{
  BmiCalculator({this.weight,this.height});
  final int height;
  final int weight;
  // ignore: non_constant_identifier_names
  double _BMI;

  String calculateBmi(){
    _BMI=weight/pow(height/100,2);
    return _BMI.toStringAsFixed(1);
  }

  String getResult(){
    if(_BMI>=25)return 'OVERWEIGHT';
    else if(_BMI>18.5) return 'NORMAL';
    else return 'UNDERWEIGHT';
  }

  String giveFinalAdvice(){
    if(_BMI>=25)return 'try to exercise more!!';
    else if(_BMI>18.5) return 'you\'re doing great!!';
    else return 'you should eat more!!';
  }
}