import 'package:flutter/material.dart';
import 'package:students_projects/constants.dart';
import 'package:students_projects/display_data_sent.dart';
import 'package:students_projects/social_icons_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenUrlIcons extends StatefulWidget {
  const OpenUrlIcons({super.key});

  @override
  State<OpenUrlIcons> createState() => _OpenUrlIconsState();
}

class _OpenUrlIconsState extends State<OpenUrlIcons> {
  final Uri _facebookLink = Uri.parse("https://facebook.com/hashem.nayra");
  final Uri _instagramLink = Uri.parse("https://instagram.com/hashem.nayra");
  final Uri _whatsAppLink = Uri.parse("https://wa.me/779055730");

  Future<void> _openUrl(Uri uri) async {
    try {
      await launchUrl(uri);
    } catch (e) {
      print("Error is: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          mySnackBarMethod(context, "Connection Success!", Colors.green),
          mySnackBarMethod(context, "Try Again!", Colors.amber),
          mySnackBarMethod(context, "Faild To Connect!", Colors.red),
          ElevatedButton(
            onPressed: (){
               showModalBottomSheet(
                context: context, 
                builder: (context){
                  return BottomSheet(
                    onClosing: (){},
                    builder: (context){
                      return Container(
                        height: 300,
                      );
                    });
                });
            }, 
            child: Text("BottomSheet")),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=> 
              DisplayDataSent(
                name: "Nayra", 
                adddress: "Aden, Yemen")));
            }, 
            child: Text("SEND DATA")),
          Expanded(
            child: Container()),
          Text("Contact Us:"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    _openUrl(_facebookLink);
                  },
                  icon: Icon(
                    SocialIcons.facebook,
                    color: mainColor,
                  )),
              IconButton(
                  onPressed: () {
                    _openUrl(_instagramLink);
                  },
                  icon: Icon(
                    SocialIcons.instagram,
                    color: Colors.pink,
                  )),
              IconButton(
                  onPressed: () {
                    _openUrl(_whatsAppLink);
                  },
                  icon: Icon(
                    SocialIcons.whatsapp,
                    color: Colors.green,
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget mySnackBarMethod(BuildContext context,
  String txt, Color clr) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context)
              .showSnackBar(
                SnackBar(content: Text(txt),
                backgroundColor: clr,
                action: SnackBarAction(label: "Undo", 
                onPressed: (){}),
                ),
              );
            }, 
            child: Text("OPEN SNACKBAR")),
    );
  }
}
