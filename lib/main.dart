import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'contact '),
    );
  }
}

//طريقة تعريف اي رابط داخل المشروع
//الطريقة الاولى
// ignore: unused_element
final Uri _urlWeb = Uri.parse('https://pub.dev/packages/url_launcher/example');
//الطريقة التانية
final Uri _web =
    Uri(scheme: 'https', path: 'pub.dev/packages/url_launcher/example');

//اعمل اتصال يطلب ادخال رقم الهاتف ويكون تعريف الرقم الهاتف بهذه الطريقة
final Uri _uriTel = Uri(scheme: 'tel', path: '+ 059_759_9350');

final Uri _uriSms = Uri(scheme: 'sms', path: '+ 059_759_9350');

// ignore: unused_element
final Uri _uriEmail = Uri(scheme: 'mailto', path: 'rawankahlout2018@gmail.com');

//launchUrl(_url) دالة تقول بفتح الرابط
Future _openWEBSITE() async {
  !await launchUrl(_web);
}

// make call
Future _makeCall() async {
  await launchUrl(_uriTel);
}

//send SMS
Future _sendSms() async {
  await launchUrl(_uriSms);
}

//send Email
Future _sendEmail() async {
  await launchUrl(_uriEmail);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(11.9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 3),
              ElevatedButton.icon(
                onPressed: () {
                  _makeCall();
                },
                icon: const Icon(Icons.phone),
                label: const Text('CALL'),
              ),
              const Spacer(flex: 1),
              ElevatedButton.icon(
                  onPressed: () {
                    _sendSms();
                  },
                  icon: const Icon(Icons.sms),
                  label: const Text('SMS')),
              const Spacer(flex: 1),
              ElevatedButton.icon(
                  onPressed: () {
                    _openWEBSITE();
                  },
                  icon: const Icon(Icons.web),
                  label: const Text('URL WEBSITE')),
              const Spacer(flex: 1),
              ElevatedButton.icon(
                  onPressed: () {
                    _sendEmail();
                  },
                  icon: const Icon(Icons.email),
                  label: const Text('MAIL')),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
