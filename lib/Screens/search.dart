

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
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
      body: Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
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
    // Implement the search results view based on the query
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement the search suggestions based on the query
    final List<String> suggestionList = [
      'Flutter',
      'Dart',
      'Mobile',
      'Development',
      'Search',
    ];

    final List<String> filteredList = suggestionList
        .where((String suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(filteredList[index]),
          onTap: () {
            query = filteredList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
