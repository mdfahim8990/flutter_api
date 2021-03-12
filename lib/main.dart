import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
   List userData;

   List Data;

  Future <List>getData() async {

  String myUrl= "https://jsonplaceholder.typicode.com/posts";

    http.Response response = await http.get(
        Uri.parse(myUrl),
      headers: {
        'Accept':'application/json'
      }
    );

    Data=json.decode(response.body);
    setState(() {
      userData  = Data;
    });
    print(userData.length);
    return userData;
  }
   @override
   void initState() {
    // TODO: implement deactivate
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest api with php"),
      ),


      body: Container(
            child: ListView.builder(
              itemCount: userData.length,
              itemBuilder: (context,index){

                return ListTile(

                  trailing: Icon(Icons.star_border),
                  title: Text(userData[index]['nuserId']),
                 subtitle: Text(userData[index]['id']),

                );
              }



            ),
      ),
    );
  }
}

