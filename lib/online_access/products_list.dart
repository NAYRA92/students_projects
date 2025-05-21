import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

final connectionToBooks = FirebaseFirestore.instance.collection("users");
// String filterData = '1';

class _ProductsListState extends State<ProductsList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("CRATER"),
          Expanded(child: Container(
            color: Colors.amber[100],
            child: streamWidget("1"))),
          Divider(
            endIndent: 50,
            indent: 50,
            color: Colors.amber,
            thickness: 3,
          ),
          Text("ALMANSOURA"),
          Expanded(child: streamWidget("4")),
           Divider(
            endIndent: 50,
            indent: 50,
            color: Colors.amber,
            thickness: 3,
          ),
          Text("ALMUALLA"),
          Expanded(child: streamWidget("3")),
           Divider(
            endIndent: 50,
            indent: 50,
            color: Colors.amber,
            thickness: 3,
          ),
        ],
      )
    );
  }


   Widget streamWidget (
    String filterData
   ){
    return StreamBuilder(
        stream: connectionToBooks
        .where("city", isEqualTo: filterData)
        .snapshots(), 
        builder: (BuildContext, AsyncSnapshot<QuerySnapshot> snapshots ){
          if(snapshots.connectionState ==
           ConnectionState.waiting){
            return Center(
              child: Text("Loading ...."));
          }
          final usersData = snapshots.data!.docs;
          return ListView.builder(
            itemCount: usersData.length,
            itemBuilder: (context, index){
              return Text(usersData[index]["name"],
              style: TextStyle(
                fontSize: 36
              ),);
            });
        });

  }
}