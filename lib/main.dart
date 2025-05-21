import 'package:flutter/material.dart';
import 'package:students_projects/online_access/chatbot_example.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:students_projects/online_access/open_url_icons.dart';
import 'package:students_projects/more_widgets/register_new_product.dart';

import 'home_page.dart';
import 'shared_preference_code.dart';
import 'students_pages/akram_login_page.dart';
import 'online_access/api_data_page.dart';
import 'online_access/geo_location_on_maps.dart';
import 'online_access/may8login_page.dart';
import 'more_widgets/may8signup_page.dart';
import 'students_pages/nawaf_home_page.dart';
import 'students_pages/on_boarding_page.dart';
import 'more_widgets/pdf_page.dart';
import 'online_access/products_list.dart';
import 'online_access/show_data.dart';
import 'more_widgets/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( //unerror will appear here, but it will go as soon as you import the needed Firebase packages
      options: FirebaseOptions(
          apiKey: "AIzaSyDDKghGDKkEjYcbTiT9m_cLD2j9IkgiuAE", //you will find apiKey, appId ... etc indside the google-services.json file that you download from firebase console!
          appId: "37782216272",
          messagingSenderId: "sendid",
          projectId: "flutter-course-may",
          storageBucket: "flutter-course-may.firebasestorage.app")); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.amber,
        fontFamily: "Amiri",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: SharedPreferenceCode(),
    );
  }
}