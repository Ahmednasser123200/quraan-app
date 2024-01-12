import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class beadsScreen extends StatefulWidget {
  const beadsScreen({super.key});

  @override
  State<beadsScreen> createState() => _beadsScreenState();
}

class _beadsScreenState extends State<beadsScreen> {
  bool sbhanall = false;
  bool alhamdllah = false;
  bool laelahaelahghh = false;
  bool alahacbar = false;
  bool buttenrestart = false;
  bool mohamed = false;
  int nummohamed = 0;
  int numsbhanall = 0;
  int numalhamdllah = 0;
  int numlaelahaelahghh = 0;
  int numalahacbar = 0;
  double rangmohamed = 0;
  double rangsbhanall = 0;
  double rangalhamdllah = 0;
  double ranglaelahaelahghh = 0;
  double rangalahacbar = 0;
  double? nom = 0.01;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: <Widget>[
          sbhanall
              ? SizedBox(
                  height: 1,
                )
              : InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      numsbhanall++;
                      rangsbhanall += nom!;
                    });
                    if (rangsbhanall > 0.9) {
                      setState(() {
                        sbhanall = true;
                      });
                    }
                    print(rangsbhanall);
                  },
                  child: new CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 10.0,
                    percent: rangsbhanall,
                    header: new Text("سًّبّْحّْاٍّنِّ اٍّلَّلَّهّْ"),
                    center: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "سًّبّْحّْاٍّنِّ اٍّلَّلَّهّْ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$numsbhanall",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                ),
          SizedBox(
            height: 10,
          ),
          alhamdllah
              ? SizedBox(
                  height: 1,
                )
              : InkWell(
            splashColor: Colors.transparent,

            onTap: () {
                    setState(() {
                      numalhamdllah++;
                      rangalhamdllah += nom!;
                    });
                    if (rangalhamdllah > 0.9) {
                      setState(() {
                        alhamdllah = true;
                      });
                    }
                  },
                  child: new CircularPercentIndicator(
                    radius: 130.0,
                    animationDuration: 1200,
                    lineWidth: 15.0,
                    percent: rangalhamdllah,
                    center: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "آلِّحَّمِّدٍّ لِّلِّهِّّْ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$numalhamdllah",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    circularStrokeCap: CircularStrokeCap.butt,
                    backgroundColor: Colors.yellow,
                    progressColor: Colors.red,
                  ),
                ),
          Row(
            children: [
              Expanded(
                child: laelahaelahghh
                    ? SizedBox(
                        height: 1,
                      )
                    : InkWell(
                  splashColor: Colors.transparent,

                  onTap: () {

                          setState(() {
                            numlaelahaelahghh++;
                            ranglaelahaelahghh += nom!;
                          });
                          if (rangalhamdllah > 0.9) {
                            setState(() {
                              laelahaelahghh = true;
                            });
                          }
                        },
                        child: new CircularPercentIndicator(
                          radius: 90.0,
                          lineWidth: 13.0,
                          percent: ranglaelahaelahghh,
                          center: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "لآ اِلَهَ اِلّا اللّهُِّّْ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "$numlaelahaelahghh",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          footer: new Text(
                            "Sales this week",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.purple,
                        ),
                      ),
              ),
              Expanded(
                child: alahacbar
                    ? SizedBox(
                        height: 1,
                      )
                    : InkWell(
                  splashColor: Colors.transparent,

                  onTap: () {
                          setState(() {
                            numalahacbar++;
                            rangalahacbar += nom!;
                          });
                          if (rangalahacbar > 0.9) {
                            setState(() {
                              alahacbar = true;
                            });
                          }
                        },
                        child: new CircularPercentIndicator(
                          radius: 90.0,
                          lineWidth: 13.0,
                          percent: rangalahacbar,
                          center: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "آلِّلِّهِّ آﮝبٍّرِ ِّّْ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "$numalahacbar",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          footer: new Text(
                            "Sales this week",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.purple,
                        ),
                      ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: mohamed
                ? SizedBox(
                    height: 1,
                  )
                : InkWell(
              splashColor: Colors.transparent,

              onTap: () {
                      setState(() {
                        nummohamed++;
                        rangmohamed += nom!;
                      });
                      if (rangmohamed > 0.9) {
                        setState(() {
                          mohamed = true;
                        });
                      }
                    },
                    child: new CircularPercentIndicator(
                      radius: 100.0,
                      lineWidth: 5.0,
                      percent: rangmohamed,
                      center: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "اللهم صّلِ وسَلّمْ \nعَلۓِ نَبِيْنَامُحَمد ﷺِّّْ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "$nummohamed",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      progressColor: Colors.green,
                    ),
                  ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: new CircularPercentIndicator(
                    radius: 45.0,
                    lineWidth: 4.0,
                    percent: 0.10,
                    center: new Text("10%"),
                    progressColor: Colors.red,
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                Expanded(
                  child: new CircularPercentIndicator(
                    radius: 45.0,
                    lineWidth: 4.0,
                    percent: 0.30,
                    center: new Text("30%"),
                    progressColor: Colors.orange,
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                Expanded(
                  child: new CircularPercentIndicator(
                    radius: 45.0,
                    lineWidth: 4.0,
                    percent: 0.60,
                    center: new Text("60%"),
                    progressColor: Colors.yellow,
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                Expanded(
                  child: new CircularPercentIndicator(
                    radius: 45.0,
                    lineWidth: 4.0,
                    percent: 0.90,
                    center: new Text("90%"),
                    progressColor: Colors.green,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
                onPressed: () {
                setState(() {
                  rangalhamdllah=0;
                  ranglaelahaelahghh=0;
                  rangalahacbar=0;
                  rangmohamed=0;
                  rangsbhanall=0;
                  numalhamdllah=0;
                  numlaelahaelahghh=0;
                  numalahacbar=0;
                  numsbhanall=0;
                  nummohamed=0;
                  alhamdllah=false;
                  laelahaelahghh=false;
                  alahacbar=false;
                  mohamed=false;
                  sbhanall=false;

                });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'restart',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),

                  ),
                )),
          ),
          SizedBox(height: 100,)
        ]),
      ),
      bottomSheet: Container(
        height: 70,
        child: Slider(
          min: 0.001,
          max: 0.1,
          onChanged: (val) {
            setState(() {
              nom = val; // Use 0.0 as the default value if val is null
            });
          },
          value: nom!, // Use 0.0 as the default value if nom is null
        ),
      ),
    );
  }
}
