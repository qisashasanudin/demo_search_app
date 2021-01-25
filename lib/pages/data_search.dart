import 'package:flutter/material.dart';
import 'package:search_bar/data/city_names.dart';

class DataSearch extends SearchDelegate<String> {
  List<String> recentCities = [];

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
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
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentCities
        : city_names
            .where((element) => element.toLowerCase().contains(query))
            .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.location_city),
        title: Text(suggestionList[index]),
        onTap: () {
          query = suggestionList[index];
          recentCities.removeWhere((element) => element == query);
          recentCities.insert(0, query);
          showResults(context);
        },
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some results based on the selection
    return Center(
      child: Text(query),
    );
  }
}
