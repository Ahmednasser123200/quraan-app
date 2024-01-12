import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/Home_page.dart';
import 'Screens/Logen_Screen.dart';
import 'Screens/Splach_screen.dart';
import 'Screens/bottom_Navegsa.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);


  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return  MaterialApp(

      debugShowCheckedModeBanner: false,
      routes: {
        "splash": (context) => SplachScreen(),
        "Logen": (context) => LogenScreens(),
        "buttom_Navegat":(context)=>buttom_Nave(),
      },
      title: 'Flutter Demo',
      home:SplachScreen()
      /*FirebaseAuth.instance.currentUser == null? LogenScreens() :buttom_Nave(),*/
    );
  }
}
