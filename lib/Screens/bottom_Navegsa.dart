import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quraan_project/Screens/search_quraan_Screen.dart';
import 'package:quraan_project/block/ginrat_buttom.dart';
import 'Adeya_page.dart';
import 'Ahades_bage.dart';
import 'Home_page.dart';
import 'Quran_page.dart';
import 'Quranreading_Screen.dart';
import 'Remembrances_page.dart';
import 'beads.screen.dart';
import 'compass_page.dart';

class buttom_Nave extends StatefulWidget {
  const buttom_Nave({super.key});

  @override
  State<buttom_Nave> createState() => _buttom_NaveState();
}

class _buttom_NaveState extends State<buttom_Nave> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SearchQuran(
                          )));},
              icon: Icon(
                Icons.search,
                color: Colors.deepOrange,
              ))
        ],
        leading: IconButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      showmodelbottom(
                        lable: 'Loge out',
                        function: () async {
                          GoogleSignIn googleSignin = GoogleSignIn();
                          googleSignin.disconnect();
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushNamedAndRemoveUntil('Logen', (route) => false);
                        },
                        width: 300,
                        hight: 60,
                        color: Colors.white,
                        icons: Icons.logout,
                      )
                    ],
                  );
                });
          },
          icon: Icon(
            Icons.list,
            color: Colors.deepOrange,
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.deepOrange,
        backgroundColor: Colors.white,
        items: [
          CurvedNavigationBarItem(
            child: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
          CurvedNavigationBarItem(
            child: Image.asset(
              'images/beads.png',width: 30,
              color: Colors.white,
            ),
          ),
          CurvedNavigationBarItem(
              child: Image.asset(
            'images/compass.png',
            color: Colors.white,
            height: 23,
          )),
          CurvedNavigationBarItem(
              child: Image.asset(
            'images/pray.png',
            color: Colors.white,
            height: 23,
          )),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          homepage(),
          qurunScreen(),
          beadsScreen(),
         compassScreen(),
          Ahades_screen()
        ],
      ),
    );
  }
}
