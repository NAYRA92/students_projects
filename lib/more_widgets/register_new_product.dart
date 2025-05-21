import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterNewProduct extends StatefulWidget {
  const RegisterNewProduct({super.key});

  @override
  State<RegisterNewProduct> createState() => _RegisterNewProductState();
}

class _RegisterNewProductState extends State<RegisterNewProduct> {
  TextEditingController _author = TextEditingController();
  TextEditingController _releaseDate = TextEditingController();
  TextEditingController _bookImage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: _author,
          ),
          TextFormField(
           controller:  _releaseDate
          ),
          TextFormField(
           controller:  _bookImage
          ),
          ElevatedButton(
            onPressed: () async {
             await FirebaseFirestore.instance
              .collection("books")
              .add({
                "author": _author.text,
                "releaseDate": _releaseDate.text,
                "bookImage": _bookImage.text,
              });
              _author.clear();
              _releaseDate.clear();
              _bookImage.clear();
            }, 
            child: Text("Submit"))
        ],
      ),
    );
  }
}