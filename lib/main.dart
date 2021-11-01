import 'dart:math';

import 'package:bmi_calculator/bmi_result_screen.dart';
import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          )),
      darkTheme: ThemeData(

        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          bodyText1: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,

          )
        ),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: HomeScreen()
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   bool isMale = true;
//   double height = 120;
//   int weight = 50;
//   int age = 20;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("BMI Calculator"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isMale = true;
//                         });
//                       },
//                       child: Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image(
//                               image: AssetImage('assets/images/male.png'),
//                               height: 90,
//                               width: 90,
//                             ),
//                             SizedBox(
//                               height: 15,
//                             ),
//                             Text("Male",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 25,
//                                 )),
//                           ],
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: isMale ? Colors.blue : Colors.deepPurple[800],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isMale = false;
//                         });
//                       },
//                       child: Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image(
//                               image: AssetImage('assets/images/female.png'),
//                               height: 90,
//                               width: 90,
//                             ),
//                             SizedBox(
//                               height: 15,
//                             ),
//                             Text("Female",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 25,
//                                 )),
//                           ],
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: isMale ? Colors.deepPurple[800] : Colors.blue,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Height",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25,
//                         )),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.baseline,
//                       textBaseline: TextBaseline.alphabetic,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("${height.round()}",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w900,
//                               fontSize: 40,
//                             )),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         Text("cm",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w900,
//                               fontSize: 20,
//                             )),
//                       ],
//                     ),
//                     Slider(
//                       value: height,
//                       max: 220,
//                       min: 80,
//                       onChanged: (value) {
//                         setState(() {
//                           height = value;
//                         });
//                       },
//                     )
//                   ],
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: Colors.deepPurple[800],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Weight",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 25,
//                               )),
//                           Text("$weight",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w900,
//                                 fontSize: 40,
//                               )),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               FloatingActionButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     weight--;
//                                   });
//                                 },
//                                 child: Icon(Icons.remove),
//                                 mini: true,
//                                 heroTag: 'weight-',
//                               ),
//                               FloatingActionButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     weight++;
//                                   });
//                                 },
//                                 child: Icon(Icons.add),
//                                 mini: true,
//                                 heroTag: 'weight+',
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.deepPurple[800],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Expanded(
//                     child: Container(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Age",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 25,
//                               )),
//                           Text(
//                             "$age",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w900,
//                               fontSize: 40,
//                             ),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               FloatingActionButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     age--;
//                                   });
//                                 },
//                                 child: Icon(Icons.remove),
//                                 mini: true,
//                                 heroTag: 'age-',
//                               ),
//                               FloatingActionButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     age++;
//                                   });
//                                 },
//                                 child: Icon(Icons.add),
//                                 mini: true,
//                                 heroTag: 'age+',
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.deepPurple[800],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             color: Colors.blue,
//             height: 50,
//             width: double.infinity,
//             child: MaterialButton(
//               child: Text(
//                 "Calculate",
//                 style: TextStyle(color: Colors.white),
//               ),
//               onPressed: () {
//                 double result = weight / pow(height / 100, 2);
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => BMIResultScreen(
//                               age: age,
//                               isMale: isMale,
//                               result: result,
//                             )));
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
