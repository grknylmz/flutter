

/// ##### ##### ##### ##### #####
/// Import:
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;  // as http;
import 'dart:io';
import 'models/image_model.dart';
import 'widgets/image_list.dart';
import 'dart:convert';
//import 'dart:async';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    final String url = 'https://jsonplaceholder.typicode.com/photos/$counter';
    
    //get(url)
    //.then((response) { print(response); });

    var response;
    // Пытаемся достучаться до URL 5 раз
    for (int attempts=1; attempts < 6; attempts++) {
      response = await get(url);
      if (response.statusCode == 200)
        break;
      else if (attempts == 5)
        return;
      else
        sleep(new Duration(seconds: 1));
    }
    ImageModel imageModel = new ImageModel.fromJSON(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepOrange[800],
        accentColor: Colors.red[600],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Number of images: $counter"),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
