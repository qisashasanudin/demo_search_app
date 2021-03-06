import 'package:flutter/material.dart';
import 'package:search_bar/pages/data_search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Demo Search App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          child: ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            onTap: () {
              showSearch(
                context: context,
                delegate: DataSearch(),
              );
            },
          ),
        ),
      ),
    );
  }
}
