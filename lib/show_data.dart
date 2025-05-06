import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:students_projects/constants.dart';
import 'package:students_projects/register_new_product.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}
String _nameInitial = "";
class _ShowDataState extends State<ShowData> {
  TextEditingController _name = TextEditingController(
    // text: _nameInitial
  );
  TextEditingController _subtitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Delete User"),
                                            content: SizedBox(
                                              height: 150,
                                              child: RegisterNewProduct()),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Cancel")),
                                              TextButton(
                                                  onPressed: ()  {
                                                    
                                                  },
                                                  child: Text("Ok"))
                                            ],
                                          );});
      },
      child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: RegisterNewProduct(),
          ),
          Expanded(
            flex: 2,
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("books").snapshots(),
                builder:
                    (BuildContext, AsyncSnapshot<QuerySnapshot> snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  final booksData = snapshots.data!.docs;

                  if (booksData.isEmpty) {
                    return const Text("No Data Found!");
                  } else {
                    return ListView.builder(
                        itemCount: booksData.length,
                        itemBuilder: (context, index) {
                          _nameInitial = booksData[index]["author"];
                          return Column(
                            children: [
                              ListTile(
                                tileColor: mainColor,
                                title: Text(
                                  booksData[index]["author"],
                                  style: TextStyle(fontSize: 34),
                                ),
                                subtitle: Text(booksData[index]["releaseDate"]),
                                leading: IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Edit User"),
                                            content: Column(
                                              children: [
                                                TextFormField(
                                                  controller: _name,
                                                  decoration: InputDecoration(
                                                    hintText:  booksData[index]["author"]
                                                  ),
                                                  
                                                ),
                                                TextFormField(
                                                  controller: _subtitle,
                                            
                                                ),
                                              ],
                                            ),

                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Cancel")),

                                              TextButton(
                                                  onPressed: () async {

                                                    if(_name.text.isEmpty || _subtitle.text.isEmpty){
                                                      print("error");
                                                    }
                                                    else {
                                                    await FirebaseFirestore.instance
                                                    .collection("books")
                                                    .doc(booksData[index].id)
                                                    .update({
                                                      "author": _name.text,
                                                      "releaseDate": _subtitle.text
                                                    });
                                                    
                                                    Navigator.pop(context);
                                                    }
                                                    
                                                  

                                                  },
                                                  child: Text("Update")),
                                            ],
                                           
                                          );
                                        });
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Delete User"),
                                            content: Text(
                                                "This User will be removed forever"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Cancel")),
                                              TextButton(
                                                  onPressed: () async {
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("books")
                                                        .doc(
                                                            booksData[index].id)
                                                        .delete();
                                                        Navigator.pop(context);
                                                  },
                                                  child: Text("Delete"))
                                            ],
                                          );
                                        });
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          );

                          // Column(
                          //   children: [
                          //     Text(
                          //       booksData[index]["author"],
                          //       style: TextStyle(
                          //         fontSize: 34
                          //       ),),
                          //     Text(booksData[index]["releaseDate"]),
                          //   ],
                          // );
                        });

                    // Text(booksData[1]["author"]);
                  }
                }),
          ),
        ],
      ),
    );
  }
}
