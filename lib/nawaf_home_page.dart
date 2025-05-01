import 'package:flutter/material.dart';

class NawafHomePage extends StatefulWidget {
  const NawafHomePage({super.key});

  @override
  State<NawafHomePage> createState() => _NawafHomePageState();
}
bool _translate = true;

class _NawafHomePageState extends State<NawafHomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _translate ?
       TextDirection.rtl : TextDirection.ltr, //right to left
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: (){
                setState(() {
                  _translate = !_translate;
                });
              }, icon: Icon(Icons.translate) )
          ],
        ),
        body: Column(
          children: [
            TextFormField(),
            Container(
              height: 300,
              child: CarouselView(
                itemExtent: 400, 
                shrinkExtent: 100,
                children: [
                  Image.asset("images/logo_1.png"),
                  Image.asset("images/background_1.png"),
                  Image.asset("images/logo_1.png"),
                ]),
            ),
      
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Text("Item 1"),
                  Text("Item 2"),
                  Text("Item 3"),
                  Text("Item 4"),
                  Text("Item 5"),
                  Text("Item 61"),
                  Text("Item 1"),
                  Text("Item 2"),
                  Text("Item 3"),
                  Text("Item 4"),
                  Text("Item 5"),
                  Text("Item 61"),
                  Text("Item 1"),
                  Text("Item 2"),
                  Text("Item 3"),
                  Text("Item 4"),
                  Text("Item 5"),
                  Text("Item 61"),
                  Text("Item 1"),
                  Text("Item 2"),
                  Text("Item 3"),
                  Text("Item 4"),
                  Text("Item 5"),
                  Text("Item 61"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}