import 'package:flutter/material.dart';

class GirlListPage extends StatefulWidget {
  GirlListPage(String title);

  @override
  _GirlListPageState createState() => _GirlListPageState();
}

class _GirlListPageState extends State<GirlListPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 15.0,
      children: <Widget>[
        Icon(Icons.call),
        Icon(Icons.call),
        Icon(Icons.call),
        Icon(Icons.call),
        Icon(Icons.call),
      ],
    );
  }
}
