import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images=[];

  void fetchImage() async {
    counter++;
    var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    var imageModel=ImageModel.fromJson(json.decode(response.body));

    images.add(imageModel);
  
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Text("helloo"),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Lets see some Images..!!'),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          backgroundColor: Colors.blue,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
