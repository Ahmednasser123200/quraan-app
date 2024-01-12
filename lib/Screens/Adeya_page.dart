import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Ahades_bage.dart';
import 'Quranreading_Screen.dart';

class adeya_screen extends StatefulWidget {
  adeya_screen({Key? key}) : super(key: key);

  @override
  State<adeya_screen> createState() => _LogenScreensState();
}

class _LogenScreensState extends State<adeya_screen>
    with SingleTickerProviderStateMixin {




  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

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
        body:
        DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[

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
                              'الاحاديث',
                              style: TextStyle(color: Colors.black, fontSize: 23),
                            )),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 85,
                        height: 60,
                        child: Center(
                            child: Text(
                              'الاذكار',
                              style: TextStyle(color: Colors.black, fontSize: 23),
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
                  children: [

                    Scaffold(
                      backgroundColor: Colors.black,
                    ),
                    Ahades_screen()

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
