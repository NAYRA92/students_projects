import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:students_projects/students_pages/nawaf_home_page.dart';

class May8loginPage extends StatefulWidget {
  const May8loginPage({super.key});

  @override
  State<May8loginPage> createState() => _May8loginPageState();
}

final connectionPhrase = FirebaseFirestore.instance.collection("users");

class _May8loginPageState extends State<May8loginPage> {
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();

  String name = "";
  String password = "";
  bool exist = false;

  Future<bool> checkExist(String docID) async {
    //docID is the mobile number
    try {
      await connectionPhrase.doc(docID).get().then((doc) {
        if (doc.exists) {
          //if document exist, check user password
          //here I made the document ID as user mobile number

          Map<String, dynamic> data = doc.data()!;
          // You can then retrieve the value from the Map like this:
          name = data['name'];
          password = data['password'];

          if (password == _password.text) {
            //
            exist = true;
            //if entered password is correct, go to next screen
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NawafHomePage(),
                ));
          }

          //if entered value is not equal to document password
          else if (password != _password.text) {
            print("Worng password");
          }
        }

        //if document not exists
        else if (!doc.exists) {
          exist = false;
          setState(() {
            print("user not found");
          });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
      return exist;
    } catch (e) {
      // If any error
      print(e);
      return false;
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _mobile,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _password,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 5) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    //for validation
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                    //end for validation
                    checkExist(_mobile.text);
                  },
                  child: Text("Log In"))
            ],
          ),
        ),
      ),
    );
  }
}
