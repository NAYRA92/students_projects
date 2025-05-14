import 'package:flutter/material.dart';
import 'package:students_projects/constants.dart';
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
          Expanded(child: Container()),
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
}
