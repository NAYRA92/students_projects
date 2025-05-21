import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:students_projects/constants.dart';


class May8signupPage extends StatefulWidget {
  const May8signupPage({super.key});

  @override
  State<May8signupPage> createState() => _May8signupPageState();
}

final connectionPhrase = 
          FirebaseFirestore
          .instance
          .collection("users");

class _May8signupPageState extends State<May8signupPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();

  String? _selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedItem = "2";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextFormField(
            controller: _name,
            decoration: InputDecoration(
              hintText: "Name"
            ),
          ),
          TextFormField(
            controller: _phone,
            decoration: InputDecoration(
              hintText: "Mobile"
            ),
          ),
          TextFormField(
            controller: _password,
            decoration: InputDecoration(
              hintText: "Password"
            ),
          ),
          DropdownButton(
            items: [
              DropdownMenuItem(child: Text("Crater"), value: "1",),
              DropdownMenuItem(child: Text("Almansoura"), value: "2",),
              DropdownMenuItem(child: Text("Almualla"), value: "3",),
              DropdownMenuItem(child: Text("Little Aden"), value: "4",),
            ], 
            value: _selectedItem,
            icon: Icon(Icons.pin_drop),
            iconEnabledColor: Colors.blue,
            isExpanded: true,
            dropdownColor: Colors.blue,
            onChanged: (value){
              setState(() {
              _selectedItem = value;
              });
            }),
          ElevatedButton(
            onPressed: () async {
            await connectionPhrase
              .doc(_phone.text)
              .set({
                'mobile': _phone.text,
                'name': _name.text,
                'password': _password.text,
                'city': _selectedItem
              });
              _phone.clear();
              _name.clear();
              _password.clear();
            }, 
            child: Text("Sign Up"))
        ],),
      )
    );
  }
}