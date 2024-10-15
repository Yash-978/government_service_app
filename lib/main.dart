
import 'package:flutter/material.dart';
import 'Screens/GoogleSearchEngine/GoogleSearchEngine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: GoogleSearchInAppWebView(),
      routes: {
        // '/':(context) => GoogleSearchInAppWebView(),
        '/':(context) => CustomWebBrowser(),
        // '/':(context) => SearchEngineApp(),
      },
    );
  }
}



