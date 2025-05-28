import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';


class TwilioPage extends StatefulWidget {
  TwilioPage({Key? key}) : super(key: key);

  @override
  _TwilioPageState createState() => _TwilioPageState();
}

class _TwilioPageState extends State<TwilioPage> {
  late TwilioFlutter twilioFlutter;
  late TwilioMessagingService twilioMessagingService;

  @override
  void initState() {
    //normal Twilio
    twilioFlutter =
        TwilioFlutter(accountSid: "", authToken: "", twilioNumber: "");

    //schedualed SMS
    twilioMessagingService = TwilioMessagingService(
        accountSid: "", authToken: "", messagingServiceSid: "");
    super.initState();
  }

  void sendSms() async {
    TwilioResponse twilioResponse =
        await twilioFlutter.sendSMS(toNumber: '+967779055730', messageBody: 'hello world');
  }

  Future<void> sendWhatsApp() async {
    TwilioResponse twilioResponse = await twilioFlutter.sendWhatsApp(
        toNumber: '', messageBody: 'hello world');
  }

  void getSms() async {
    TwilioResponse twilioResponse = await twilioFlutter.getSmsList();

    await twilioFlutter.getSMS('');
  }

  void sendScheduledSms() async {
    await twilioMessagingService.sendScheduledSms(
        toNumber: '',
        messageBody: 'hello world',
        sendAt: '2024-03-18T16:18:55Z');
  }

  void cancelScheduledSMS() async {
    TwilioResponse twilioResponse =
        await twilioMessagingService.cancelScheduledSms(messageSid: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Click the button to send SMS.',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendSms,
        tooltip: 'Send Sms',
        child: Icon(Icons.send),
      ),
    );
  }
}