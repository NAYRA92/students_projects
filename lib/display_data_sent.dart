import 'package:flutter/material.dart';


class DisplayDataSent extends StatefulWidget {
  final String name;
  final String adddress;
  const DisplayDataSent({
    super.key, required this.name, required this.adddress,});

  @override
  State<DisplayDataSent> createState() => _DisplayDataSentState();
}

class _DisplayDataSentState extends State<DisplayDataSent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.name),
          Text(widget.adddress),

        ],
      ),
    );
  }
}