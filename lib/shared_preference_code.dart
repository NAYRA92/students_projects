import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:students_projects/home_page.dart';
import 'package:students_projects/more_widgets/splash_screen.dart';

//this code in the main.dart
class SharedPreferenceCode extends StatelessWidget {
  const SharedPreferenceCode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preference App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<Map<String, dynamic>>(
        future: _checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // شاشة تحميل أثناء التحقق من الحالة
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData && snapshot.data!['isLoggedIn']) {
              // إذا كان المستخدم مسجل دخوله
              return HomePage(); // صفحة الحساب مع تمرير الرقم
            } else {
              // إذا لم يكن المستخدم مسجل دخوله
              return SplashScreen(); // صفحة الدخول
            }
          }
        },
      ),
    );
  }
//in second page
  // await prefs.setBool('isLoggedIn', true);

  // دالة للتحقق من حالة تسجيل الدخول واسترجاع الرقم
  Future<Map<String, dynamic>> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false; // حالة تسجيل الدخول
    return {'isLoggedIn': isLoggedIn};
  }
}
