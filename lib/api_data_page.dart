import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiDataPage extends StatefulWidget {
  const ApiDataPage({super.key});

  @override
  State<ApiDataPage> createState() => _ApiDataPageState();
}

class _ApiDataPageState extends State<ApiDataPage> {

  List<dynamic> users_list = [];

  Future<void> fetch_data_from_api() async {
    String url = "https://jsonplaceholder.typicode.com/albums"; //api link
    try{
      final response = await http.get(Uri.parse(url));
      //status code for http response
      //200 success/ok
      //404 not found
      //500 faild/rejected
      if(response.statusCode == 200){
        final json_data = jsonDecode(response.body);

        for(var index in json_data){
          users_list.add(index);
        }
        print(users_list[2]["title"]);
        // print(json_data["name"]);
        // print(response.body);
      }
      else{
      }
      // if(response.statusCode == 500){

      // }
    }
    catch(error){
      print(error);
    }

  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_data_from_api();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: ListView.builder(
      itemCount: users_list.length,
      itemBuilder: (context, index){
        return Text(users_list[index]["title"]);
      }),
    );
  }
}