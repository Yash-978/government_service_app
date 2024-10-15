
import 'package:flutter/material.dart';
import 'Screens/GoogleSearchEngine/GoogleSearchEngine.dart';
import 'Screens/all_In_One_app/HomePage.dart';

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
      initialRoute: '/home',
      routes: {
        '/':(context) => GoogleSearchInAppWebView(),
        '/home':(context) => HomeScreen(),
        // '/':(context) => CustomWebBrowser(),
        // '/':(context) => SearchEngineApp(),
      },
    );
  }
}



