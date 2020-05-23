import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_card.dart';
import 'icon_content.dart';
import 'constans.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                      colour: selectedGender == Gender.male
                          ? kActiveColour
                          : kInactiveColour,
                    ),
                  ),
                  Expanded(
                      child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                    colour: selectedGender == Gender.female
                        ? kActiveColour
                        : kInactiveColour,
                  )),
                ],
              ),
            ),
            Expanded(
              child: ReuseableCard(
                colour: kActiveColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextSize,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyler
                          ),
                          Text(
                            'cm',
                            style: kLabelTextSize,
                          ),

                        ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor:Color(0x15EB1555) ,
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0
                        )
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 90.0,
                          max: 220.0,
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                          }
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(

                      child: ReuseableCard(
                    colour: kActiveColour,
                  )),
                  Expanded(child: ReuseableCard(colour: kActiveColour)),
                ],
              ),
            ),
            Container(
              color: kBottomColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ],
        ));
  }
}
