import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quraan_project/Screens/search.dart';



class QuranScreen extends StatefulWidget {
  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<dynamic> surahs = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
        'https://cdn.jsdelivr.net/gh/fawazahmed0/quran-api@1/editions/ara-quranacademy.json' as Uri);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        surahs = data['data']['surahs'];
      });
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      body: surahs.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: surahs.length,
        itemBuilder: (context, index) {
          final surah = surahs[index];
          return ListTile(
            title: Text('${surah['name']}'),
            subtitle: Text('Ayahs: ${surah['ayahs']}'),
          );
        },
      ),
    );
  }
}
