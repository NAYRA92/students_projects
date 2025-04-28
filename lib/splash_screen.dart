import "package:flutter/material.dart";
import "package:students_projects/home_page.dart";


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1),
    (){
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context)=>HomePage()));
    }
    
    );

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background_1.png"),
            fit: BoxFit.cover
            )
        ),
        child: Image.asset("images/logo_1.png"),
      ),
    );
  }
}