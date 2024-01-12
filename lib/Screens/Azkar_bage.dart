import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AzkarScreen extends StatefulWidget {
  final nom;

  const AzkarScreen({super.key, this.nom});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  List bost = [];

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

  double nom = 20;

  @override
  void initState() {
    getdata();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: bost.isEmpty
            ? Center(child: CircularProgressIndicator())
            : PageView.builder(
                itemCount: bost[0][widget.nom].length,
                itemBuilder: (context, i) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 90, horizontal: 30),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(3, 3),
                              blurRadius: 3,
                              spreadRadius: 3)
                        ],
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.deepOrange, width: 10)),
                    child: Center(
                      child: Text(
                        '${bost[widget.nom + 1][i]['content']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: nom,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
        bottomSheet: Container(
          height: 30,
          child: Slider(
            min: 10,
            max: 50,
            onChanged: (val) {
              setState(() {
                nom = val;
              });
            },
            value: nom,
          ),
        ));
  }
}
