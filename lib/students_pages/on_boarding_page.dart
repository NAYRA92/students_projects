import 'package:flutter/material.dart';
import 'package:students_projects/home_page.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  final _pageController = PageController();
  int _currentPage = 0;

  void _previuosPage(){
    _pageController.previousPage(
      duration: Duration(milliseconds: 1500), 
      curve: Curves.linearToEaseOut);
  }

  void _nextPage(){
    _pageController.nextPage(
      duration: Duration(milliseconds: 1500), 
      curve: Curves.linearToEaseOut);
  }



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          // fit: StackFit.expand,
          children: [
            PageView(
              controller: _pageController,
              children: [
                Image.asset("images/onboarding_1.jpg",
                fit: BoxFit.cover,),
                Image.asset("images/onboarding_2.jpg",
                fit: BoxFit.cover,),
                Image.asset("images/onboarding_3.jpg",
                fit: BoxFit.cover,),
              ],
              onPageChanged: (index){
                setState(() {
                  _currentPage = index;
                });
              },
            ),
        
            Positioned(
              bottom: 1,
              left: 1,
              right: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentPage <= 0 ? Container() :
                  IconButton(
                    onPressed: _previuosPage, 
                    icon: Icon(
                      Icons.arrow_left_rounded, 
                      size: 70, color: Colors.pink,)),
                        
                    _currentPage == 2 ? 
                      IconButton(
                    onPressed: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>HomePage()));
                    },  icon: Icon(
                      Icons.check_box,
                      size: 50, color: Colors.pink,))
                    :
                     IconButton(
                    onPressed: _nextPage, 
                    icon: Icon(
                      Icons.arrow_right_rounded, 
                      size: 70, color: Colors.pink,))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}