import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:students_projects/constants.dart';

class ChatbotExample extends StatefulWidget {
  const ChatbotExample({super.key});

  @override
  State<ChatbotExample> createState() => _ChatbotExampleState();
}

//model settings
GenerativeModel _mymodel = GenerativeModel(
    model: "gemini-2.0-flash",
    apiKey: "AIzaSyAurk7gyMlYYT8hT8OZuc_scXffJXsPR8E",
    systemInstruction: Content.text("""
اذا تم الطلب من لكتابة رسالة صباحية فأنت توجهها للمهندسين فقط
  أنت تضيف ايموجيات سعيدة كذلك
  """));

//to start the chat
final ChatSession _chatSession = _mymodel.startChat();
String messageFromAi = "";

TextEditingController _mycontroller = TextEditingController();

List<String> responseList = []; //here
List<String> userList = []; //here

class _ChatbotExampleState extends State<ChatbotExample> {
  Future<void> chatResponse(String msg) async {
    try {
      final message = Content.text(msg);
      final response = await _chatSession.sendMessage(message);
      setState(() {
        messageFromAi = response.text!;
        userList.add(msg);
        responseList.add(messageFromAi); //here
      });
      //print(response.text);
    } catch (error) {
      print("Erorr: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: _mycontroller,
          ),

          // Text(messageFromAi),

          //for viewing the data in the responseList
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: responseList.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    crossAxisAlignment: userList.isNotEmpty
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      //user input
                      Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                // bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              )),
                          child: Text(
                            userList[index],
                            style: TextStyle(fontSize: 30),
                          )),

                      //ai response
                      Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                // bottomLeft: Radius.circular(15),
                              )),
                          child: Text(
                            responseList[index],
                            style: TextStyle(fontSize: 30),
                          )),
                    ],
                  ),
                );
              },
            ),
          ),

          ElevatedButton(
              onPressed: () {
                chatResponse(_mycontroller.text);
              },
              child: Text("Send Message"))
        ],
      ),
    );
  }
}
