import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:quraan_project/Screens/Azkar_bage.dart';

import '../block/ginrat_buttom.dart';
import 'Quranreading_Screen.dart';
import 'adya2Screen.dart';

class Ahades_screen extends StatefulWidget {
  const Ahades_screen({super.key});

  @override
  State<Ahades_screen> createState() => _Ahades_screenState();
}

class _Ahades_screenState extends State<Ahades_screen> {
  List bost = [];
  List azkare = [
    "أذكار الصباح",
    "أذكار المساء",
    "أذكار بعد السلام من الصلاة المفروضة",
    "تسابيح",
    "أذكار النوم",
    "أدعية قرآنية",
    "أدعية الأنبياء"
  ];

  Future<void> getdata() async {
    try {
      var response = await get(Uri.parse(
          "https://raw.githubusercontent.com/nawafalqari/azkar-api/56df51279ab6eb86dc2f6202c7de26c8948331c1/azkar.json"));

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        var timings = responseBody;

        if (timings is Map<String, dynamic>) {
          // التحديد الصحيح للبيانات، لأن 'timings' هو Map
          bost.addAll(timings.values);
          setState(() {});
        } else {
          print("خطأ: البيانات ليست من النوع المتوقع");
        }
      } else {
        print("حدث خطأ في جلب البيانات. الرمز: ${response.statusCode}");
      }
    } catch (e) {
      print("حدث خطأ: $e");
    }
    print(bost);
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Azkar2Screen(
                          nom: 0,
                        )));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 30),
                child: Text(
                  "أذكار الصباح",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )),
          Container(
            height: 580,
            child: bost == null || bost.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GeneralButton3(
                            lable: '${azkare[i + 1]}',
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AzkarScreen(
                                            nom: i,
                                          )));
                            },
                            width: 300,
                            hight: 50,
                            color: Colors.white,
                          ),
                        )),
          ),
        ],
      ),

    );
  }
}
