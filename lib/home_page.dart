import 'package:flutter/material.dart';
import 'package:students_projects/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "App Title",
          style: TextStyle(
            color: secondColor
          ),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(
              Icons.notifications_outlined,
              color: secondColor,))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Welcome Back,",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),),
              Text(" Jane",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 24,
                fontWeight: FontWeight.w100
              ),)
            ],
          )
        ],
      ),
    );
  }
}