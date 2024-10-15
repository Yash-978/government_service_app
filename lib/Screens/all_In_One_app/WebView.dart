import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends StatelessWidget {
  String webUrl,name;
  WebView({super.key, required this.name,required this.webUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        title: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(webUrl)),
        ),
      ),
    );
  }
}