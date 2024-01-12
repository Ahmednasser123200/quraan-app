import 'package:flutter/material.dart';

import '../block/ginrat_buttom.dart';

class RemembrancesScreen extends StatelessWidget {
  const RemembrancesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text(
            "الادعيه والازكار",
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          GeneralButton3(
            lable: 'أذكار الصباح',
            function: () {},
            width: 300,
            hight: 60,
            color: Colors.white,
          ),
          Container(
              height: 330,
              child: ListView.builder(
                itemCount: 4,
               itemBuilder:(context,i){
                  return  GeneralButton3(
                    lable: 'أذكار الصباح',
                    function: () {},
                    width: 300,
                    hight: 60,
                    color: Colors.white,
                  );
               }


              ))
        ],
      ),
    );
  }
}
