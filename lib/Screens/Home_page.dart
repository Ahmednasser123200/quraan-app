import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../data/name_of data.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List bost = [];
  List sala = [
    "صلاة الفجْر",
    "الشروق",
    "صلاة الظُّهْر",
    'صلاة العَصر',
    'صلاة المَغرب',
    'صلاة العِشاء'
  ];

  Future<void> getdata() async {
    try {
      var response = await get(Uri.parse(
          "https://api.aladhan.com/v1/timingsByCity/20-11-2023?city=cairo&country=egypt&method=8"));

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
      body: bost == null || bost.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Stack(children: [
                  Container(
                    height: 120,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Color(0xFF0e0e0e),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            child: Image.asset(
                          "images/images.jpeg",
                          alignment: Alignment.centerRight,
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${bost[2]["date"]["gregorian"]["weekday"]["en"]}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 7,
                              ),
                              height: 40,
                              width: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: Row(
                                children: [
                                  Text(
                                    "${bost[2]["date"]["hijri"]["month"]["ar"]}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "${bost[2]["date"]["hijri"]["day"]}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "${bost[2]["date"]["hijri"]["year"]}",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 90,
                  width: 370,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(3, 3),
                            blurRadius: 3,
                            spreadRadius: 3)
                      ]),
                  child: Column(
                    children: [
                      Text(
                        "باقى على صلاه المغرب",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        '1:30:20',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 485,
                  width: 400,
                  child: ListView.builder(
                    itemCount: 5,
                    //bost[2]["timings"] != null
                    //     ? bost[2]["timings"].length
                    //     : 0,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 80,
                          width: 30,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(3, 3),
                                    blurRadius: 3,
                                    spreadRadius: 3)
                              ],
                              color: Colors.grey.shade200,
                              border: Border.all(
                                  color: Colors.deepOrange, width: 5),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  "${bost[2]["timings"]["${timings[i]}"]}",
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              Container(
                                width: 2,
                                color: Colors.deepOrange,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  "${sala[i]}",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                            ],
                          ),
                        ),
                      );
                      // return GeneralButton3(
                      //   lable: "   ${timings[i]}            ${bost[2]["timings"]["${timings[i]}"] } "   ,
                      //   function: () {},
                      //   width: 280,
                      //   hight: 50,
                      //   color: Colors.white,
                      // );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
