import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:students_projects/constants.dart';


class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
                .collection("books")
                .snapshots(), 
        builder: (BuildContext, AsyncSnapshot<QuerySnapshot> snapshots){
     
          if(snapshots.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }

        final booksData = snapshots.data!.docs;
        
           if (booksData.isEmpty){
             return const Text("No Data Found!");
          }
          else {
          return ListView.builder(
            itemCount: booksData.length,
            itemBuilder: (context, index){
              return Column(
                children: [
                  ListTile(
                    tileColor: mainColor,
                    title:  Text(
                        booksData[index]["author"],
                        style: TextStyle(
                          fontSize: 34
                        ),),
                  
                  subtitle:Text(booksData[index]["releaseDate"]),
                  ),
                  SizedBox(height: 20,)
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

        }
        
        ),
    );
  }
}