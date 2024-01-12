import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Quranreading_Screen.dart';
class SearchQuran extends StatefulWidget {
  const SearchQuran({Key? key}) : super(key: key);

  @override
  _SearchQuranState createState() => _SearchQuranState();
}

class _SearchQuranState extends State<SearchQuran> {
  List bost = [];
  List<String> quransearch = [];

  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    try {
      var response = await get(Uri.parse("http://api.alquran.cloud/v1/quran/quran-uthmani"));

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        var timings = responseBody;

        if (timings is Map<String, dynamic>) {
          bost.addAll(timings.values);
          populateQuranSearch(); // Populate quransearch list
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

  // Populate quransearch with Quran names
  void populateQuranSearch() {
    for (int i = 0; i < bost[2]["surahs"].length; i++) {
      quransearch.add(bost[2]["surahs"][i]["name"].toString());
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
              showSearch(context: context, delegate: CustomSearchDelegate(quransearch));
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        child: bost.isEmpty?
          Center(child: CircularProgressIndicator()):

        ListView.builder(
          itemCount: quransearch.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(quransearch[index],textAlign: TextAlign.end,),
              onTap: () {
                // Navigate to QuranReading screen when an item is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuranReading(
                      numof: index, // You need to implement findIndexForQuranName
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> quransearch;

  CustomSearchDelegate(this.quransearch);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Provide an empty string or any other non-null value
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> filteredList = quransearch
        .where((String suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(filteredList[index],textAlign: TextAlign.end,),
          onTap: () {
            // Navigate to QuranReading screen when an item is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuranReading(
                  numof: index, // You need to implement findIndexForQuranName
                ),
              ),
            );
          },
        );
      },
    );
  }

  // You need to implement this method to find the index of the selected Quran name
  int findIndexForQuranName(String selectedQuranName) {
    // Add your logic to find the index based on the selectedQuranName
    // For example, you might want to search bost[2]["surahs"] for the correct index
    int index = 0 ; // Placeholder, replace with your logic
    return index;
  }
}

