

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {

  final pdf = pw.Document();
  void _creatPdf() async {
    
  final fontData = await rootBundle.load("fonts/Amiri-Regular.ttf");
  final ttf = pw.Font.ttf(fontData);//

    pdf.addPage(pw.Page(
      theme: pw.ThemeData(
        defaultTextStyle: pw.TextStyle(
          font: ttf
        )
      ),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text("Hello World"),
        ); // Center
      })); 

// final output = await getTemporaryDirectory();
// final file = File('${output.path}/example.pdf');
// await file.writeAsBytes(await pdf.save());
  }
   double _sliderValue = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: Column(
         children: [
           ElevatedButton(
            onPressed: _creatPdf, 
            child: Text("Create PDF",
            style: TextStyle(
              fontSize: _sliderValue
            ),)),

          //slider
          Slider(
            value: _sliderValue,
            onChanged: (value){
              setState(() {
                _sliderValue = value;
              });
            },
            min: 10,
            max: 74,
            // divisions: 4,
            label: "Slider",
          )
         ],
       ),
     ),
    );
  }
}