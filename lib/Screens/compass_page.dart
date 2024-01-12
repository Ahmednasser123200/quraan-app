import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class compassScreen extends StatefulWidget {
  const compassScreen({super.key});

  @override
  State<compassScreen> createState() => _compassScreenState();
}

class _compassScreenState extends State<compassScreen> {
  double? heading = 0;

  @override
  void initState() {
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Compass'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${heading!.ceil()}',
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'images/modernmd.png',
                  width: 600,
                  fit: BoxFit.fill,
                ),Transform.rotate(angle: ((heading??0)*(pi/180)*-1),
            child: Image.asset('images/compassss.png'),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
