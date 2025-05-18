import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';


class GeoLocationOnMaps extends StatefulWidget {
  const GeoLocationOnMaps({super.key});

  @override
  State<GeoLocationOnMaps> createState() => _GeoLocationOnMapsState();
}

String _get_Location = "User Location", 
user_long = "", 
user_lat ="";


class _GeoLocationOnMapsState extends State<GeoLocationOnMaps> {
 Position? _userCurrentlocation;

  Future<void> _getUserLocation() async{
    _userCurrentlocation =  await Geolocator.getCurrentPosition();
    setState(() {
      
    user_lat = _userCurrentlocation!.latitude.toString();
    user_long = _userCurrentlocation!.longitude.toString();
      _get_Location = "User Location: $user_lat , $user_long";
    });
 
    print(_userCurrentlocation);
  }

Future<void> _openUrl() async {
  final Uri _userLocationUrl = Uri.parse("https://www.google.com/maps/@$user_lat,$user_long");
  await launchUrl(_userLocationUrl);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(
            onPressed: 
              _getUserLocation,
            child: Text("Get Location",
            style: TextStyle(fontSize: 30),)),
          
          SelectableText(_get_Location,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),),

          ElevatedButton(
            onPressed: 
              _openUrl,
            child: Text("Go To Location",
            style: TextStyle(fontSize: 30),)),
        ],),
      ),
    );
  }
}