import 'package:flutter/material.dart';
import 'dart:io'; // for using HttpClient
import 'dart:convert';

import 'package:untitled1/screens/DataDetails.dart'; // for using json.decode()

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'RnS Solution',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The list that contains information about photos
  List mydata = [];

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    const API_URL = 'https://api.openbrewerydb.org/breweries';

    HttpClient client = new HttpClient();
    client.autoUncompress = true;

    final HttpClientRequest request = await client.getUrl(Uri.parse(API_URL));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    final HttpClientResponse response = await request.close();

    final String content = await response.transform(utf8.decoder).join();
    final List data = json.decode(content);

    setState(() {
      mydata = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('ENS Solution'),
        ),
        body: SafeArea(
            child: mydata.length == 0
                ? Center(
              child: ElevatedButton(
                child: Text('Load Data'),
                onPressed: _fetchData,
              ),
            )
            // The ListView that displays photos
                : ListView.builder(
              itemCount: mydata.length,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                     context, MaterialPageRoute(
                        builder: (context) => DataDetails(
                          ListTile(
                            leading: Text(
                              mydata[index]["id"].toString(),),
                            title: Text(mydata[index]['obdb_id'].toString()),
                            subtitle:
                            Text('name: ${mydata[index]["name"]}'),
                          ),
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Text(
                      mydata[index]["id"].toString(),),
                    title: Text(mydata[index]['obdb_id'].toString()),
                    subtitle:
                    Text('name: ${mydata[index]["name"]}'),
                  ),
                );
              },
            )));
  }
}