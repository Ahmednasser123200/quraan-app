import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuranReading extends StatefulWidget {
  const QuranReading({Key? key, required this.numof}) : super(key: key);
  final int numof;

  @override
  _QuranReadingState createState() => _QuranReadingState();
}

class _QuranReadingState extends State<QuranReading> {
  List bost = [];
  List<String> quren = [];
  double nom = 20;
  double? newnom;

  Future<void> getData() async {
    try {
      final response = await http
          .get(Uri.parse("https://api.alquran.cloud/v1/quran/quran-uthmani"));

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final timings = responseBody;

        if (timings is Map<String, dynamic>) {
          bost.addAll(timings.values);
          print(bost);
          writeQuran();
          setState(() {});
        } else {
          print("Error: Data is not in the expected format");
        }
      } else {
        print("Error fetching data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void writeQuran() {
    for (int i = 0; i < bost[2]["surahs"][widget.numof]["ayahs"].length; i++) {

      quren.add(bost[2]["surahs"][widget.numof]["ayahs"][i]["text"].toString());
      quren.add('[${bost[2]["surahs"][widget.numof]["ayahs"][i]["number"].toString()}]');

    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيم")),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            onPressed: () {
            },
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: bost == null || bost.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 4)),
              child: ListView(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${quren.join()}",style: TextStyle(fontSize: nom),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),

            ),
      bottomSheet: Container(
        height: 30,
        child: Slider(
          min: 10,
          max: 50,
          onChanged: (val) {
            setState(() {
              nom=val;
            });
          },
          value: nom,
        ),
      ),

    );

  }
}
