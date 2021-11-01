import 'dart:math';

import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double height = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    buildGender(context, 'male'),
                    SizedBox(width: 15.0),
                    buildGender(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[500],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'CM',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Slider(
                        max: 230.0,
                        min: 90.0,
                        value: height,
                        onChanged: (double value) {
                          setState(() {
                            height = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    buildWeightAndAge(context, 'weight'),
                    const SizedBox(width: 15.0),
                    buildWeightAndAge(context, 'age'),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).backgroundColor),
                overlayColor: MaterialStateProperty.resolveWith((states) =>
                    states.contains(MaterialState.pressed)
                        ? Colors.blue
                        : null),
                minimumSize: MaterialStateProperty.all(
                  Size(
                      double.infinity, MediaQuery.of(context).size.height / 16),
                ),
              ),
              onPressed: () {
                var result = weight / pow(height / 100, 2);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                            result: result, isMale: isMale, age: age)));
              },
              child: Text('Calculate'),
            )
          ],
        ),
      ),
    );
  }

  Widget buildGender(BuildContext context, String type) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        setState(() {
          isMale = (type == 'male') ? true : false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (isMale && type == 'male') || (!isMale && type == 'female')
              ? Colors.blue
              : Colors.grey[500],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text((type == 'male') ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2),
            const SizedBox(
              height: 15.0,
            ),
            Icon(
              (type == 'male') ? Icons.male : Icons.female,
              size: 90,
            )
          ],
        ),
      ),
    ));
  }

  Widget buildWeightAndAge(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.grey[500]),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                (type == 'weight') ? 'Weight' : 'Age',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 15.0),
              Text(
                (type == 'weight') ? '$weight' : '$age',
                style: Theme.of(context).textTheme.headline1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    splashColor: Colors.blue,
                    onPressed: () {
                      setState(() {
                        (type == 'weight') ? weight-- : age--;
                      });
                    },
                    backgroundColor: Theme.of(context).backgroundColor,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    mini: true,
                  ),
                  const SizedBox(width: 15.0),
                  FloatingActionButton(
                    splashColor: Colors.blue,
                    onPressed: () {
                      setState(() {
                        (type == 'weight') ? weight++ : age++;
                      });
                    },
                    backgroundColor: Theme.of(context).backgroundColor,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    mini: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
