import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';


class ChatbotExample extends StatefulWidget {
  const ChatbotExample({super.key});

  @override
  State<ChatbotExample> createState() => _ChatbotExampleState();
}

//model settings
GenerativeModel _mymodel = GenerativeModel(
model: "gemini-2.0-flash", 
apiKey: " ",
systemInstruction: Content.text(
  """
اذا تم الطلب من لكتابة رسالة صباحية فأنت توجهها للمهندسين فقط
  أنت تضيف ايموجيات سعيدة كذلك
  """
)
);
//to start the chat
final ChatSession _chatSession = _mymodel.startChat();
String messageFromAi = "";

TextEditingController _mycontroller = TextEditingController();

class _ChatbotExampleState extends State<ChatbotExample> {

Future<void> chatResponse(
  String msg
) async {
  final message = Content.text(msg);
  final response = await _chatSession.sendMessage(message);
  setState(() {
  messageFromAi = response.text!;
  });
  //print(response.text);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: _mycontroller,
          ),

          Text(messageFromAi),
          ElevatedButton(
          onPressed: (){
            chatResponse(
              _mycontroller.text
            );
          }, 
          child: Text("Send Message"))
      ],
      ),
    );
  }
}