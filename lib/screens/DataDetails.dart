import 'package:flutter/material.dart';

class DataDetails extends StatefulWidget {
  DataDetails(ListTile mylistTile);


  @override
  _DataDetailsState createState() => _DataDetailsState();
}

class _DataDetailsState extends State<DataDetails> {
  get mylistTile => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail of Bebrewery"),
      ),
      body: SafeArea(
        child: Center(
          child: mylistTile,
        ),
      ),
    );
  }
}
