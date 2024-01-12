import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'Logen_Screen.dart';
import 'bottom_Navegsa.dart'; // Assuming Logen_Screen.dart contains the LogenScreens class

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
          () {
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LogenScreens(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => buttom_Nave(),
              ),
            );
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(width: double.infinity,
        child: Image.asset('images/splach.jpg', fit: BoxFit.fill),
      ),
    );
  }
}
