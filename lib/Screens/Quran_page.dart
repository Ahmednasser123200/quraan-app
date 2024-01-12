import 'dart:convert';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'Quranreading_Screen.dart';

class qurunScreen extends StatefulWidget {
  qurunScreen({Key? key}) : super(key: key);

  @override
  State<qurunScreen> createState() => _LogenScreensState();
}

class _LogenScreensState extends State<qurunScreen>
    with SingleTickerProviderStateMixin {
  List bost = [];

  Future<void> getdata() async {
    try {
      var response = await get(
          Uri.parse("http://api.alquran.cloud/v1/quran/quran-uthmani"));


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

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getdata();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: bost == null || bost.isEmpty
            ? Center(child: CircularProgressIndicator())
            : DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70,
                      width: 200,
                      child: Image.asset('images/iconebhoto.jpg'),
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,

                              // changes position of shadow
                            ),
                          ],
                          border: Border.all(color: Colors.black45),
                          borderRadius: BorderRadius.circular(10)),
                      child: ButtonsTabBar(
                        controller: _tabController,
                        // Customize the appearance and behavior of the tab bar
                        backgroundColor: Colors.red,

                        //borderWidth: 2,
                        //borderColor: Colors.black,
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        // Add your tabs here
                        tabs: [
                          Tab(
                            child: Container(
                              width: 85,
                              height: 60,
                              child: Center(
                                  child: Text(
                                'السور',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 23),
                              )),
                            ),
                          ),
                          Tab(
                            child: Container(
                              width: 85,
                              height: 60,
                              child: Center(
                                  child: Text(
                                'الشيوخ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 23),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [Scaffold(
                          backgroundColor: Colors.white,
                          body: Container(
                            height: double.infinity,
                            width: 400,
                            child: ListView.separated(
                              separatorBuilder: (context, j) {
                                return Container(
                                  height: 1,
                                  color: Colors.black,
                                );
                              },
                              itemCount: bost[2]["surahs"].length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                QuranReading(
                                                  numof: i,
                                                )));
                                  },
                                  child: Container(
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 20),
                                    height: 70,
                                    width: 280,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 30,),
                                        Container(
                                          width: 250,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${bost[2]["surahs"][i]["name"]}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                  " (${bost[2]["surahs"][i]["ayahs"].length}     ايه   )")
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        CircleAvatar(
                                          child: Text(
                                            "${i + 1}",
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                          backgroundColor: Colors.black,
                                          radius: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                          Scaffold(),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
