import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Intent Handling',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Message Screen.'),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final String title;

  MyHomePage({super.key, required this.title});

  final Uri toLaunch = Uri.parse('upi://pay?pa=indiaideas@icici&pn=9399&mc=NA&tr=dummyRefId&tn=Pay&am=2.00&mam=2.00&cu=INR'); //https://www.cylog.org/headers/
  Future<void>? _launched;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Click the link below:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchInBrowserView(toLaunch),
              child: const Text('Open Deep Link'),
            ),
          ],
        ),
      ),
    );
  }
}


_launchInBrowserView(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}



