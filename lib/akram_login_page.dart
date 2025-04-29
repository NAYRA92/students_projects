import "package:flutter/material.dart";
import "package:students_projects/constants.dart";

class AkramLoginPage extends StatefulWidget {
  const AkramLoginPage({super.key});

  @override
  State<AkramLoginPage> createState() => _AkramLoginPageState();
}

class _AkramLoginPageState extends State<AkramLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          bottom: 60
        ),
        decoration: BoxDecoration(
          color: secondColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(85),
            bottomRight: Radius.circular(85),
          )
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),

           //user profile 
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 70,
            ),

             SizedBox(
              height: 20,
            ),

            //login form
            Container(
              height: 350,
              width: 370,
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  akramFormField(),
                   akramFormField(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonsColor,
                    ),
                    onPressed: (){}, 
                    child: Text("دخول",
                    style: TextStyle(
                      color: Colors.white
                    ),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget akramFormField() {
    return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                );
  }


}