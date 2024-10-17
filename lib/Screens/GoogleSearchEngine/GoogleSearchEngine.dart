import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

late InAppWebViewController webViewController;
TextEditingController searchController = TextEditingController();

class GoogleSearchInAppWebView extends StatefulWidget {
  const GoogleSearchInAppWebView({super.key});

  @override
  _GoogleSearchInAppWebViewState createState() =>
      _GoogleSearchInAppWebViewState();
}

class _GoogleSearchInAppWebViewState extends State<GoogleSearchInAppWebView> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E1F22),
        centerTitle: true,
        title: const Text(
          'Google',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              String query = searchController.text;
              if (query.isNotEmpty) {
                String url =
                    Uri.https('www.google.com', '/search', {'q': query})
                        .toString();
                webViewController.loadUrl(
                  urlRequest: URLRequest(url: WebUri.uri(Uri.parse(url))),
                );
              }
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: SizedBox(
            height: h * 0.065,
            width: w * 0.92,
            child: TextField(
              style: TextStyle(color: Colors.white),
              autocorrect: true,
              controller: searchController,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/images/googleLogo.png'),
                ),
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white)),
                filled: true,
                fillColor: Color(0xff939393),
              ),
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  String url =
                      Uri.https('www.google.com', '/search', {'q': query})
                          .toString();
                  webViewController.loadUrl(
                    urlRequest: URLRequest(url: WebUri.uri(Uri.parse(url))),
                  );
                }
              },
            ),
          ),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest:
            URLRequest(url: WebUri.uri(Uri.parse("https://www.google.com"))),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
      ),
    );
  }
}

/*
* import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

late InAppWebViewController webViewController;
TextEditingController searchController = TextEditingController();
String homepageUrl = "https://www.google.com";
List<String> bookmarks = [];

class CustomWebBrowser extends StatefulWidget {
  const CustomWebBrowser({super.key});

  @override
  _CustomWebBrowserState createState() => _CustomWebBrowserState();
}

class _CustomWebBrowserState extends State<CustomWebBrowser> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E1F22),
        centerTitle: true,
        title: const Text(
          'Flutter Browser',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              webViewController.reload();
            },
          ),
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
              webViewController.loadUrl(
                urlRequest: URLRequest(url: WebUri.uri(Uri.parse(homepageUrl))),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.bookmark, color: Colors.white),
            onPressed: () {
              String? currentUrl = webViewController.getUrl().toString();
              if (!bookmarks.contains(currentUrl)) {
                bookmarks.add(currentUrl);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Page bookmarked!')),
                );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              webViewController.goBack();
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              webViewController.goForward();
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: SizedBox(
            height: h * 0.065,
            width: w * 0.92,
            child: TextField(
              style: TextStyle(color: Colors.white),
              autocorrect: true,
              controller: searchController,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.white),
                hintText: "Search or type URL...",
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white)),
                filled: true,
                fillColor: Color(0xff939393),
              ),
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  String url = query.startsWith('http')
                      ? query
                      : Uri.https('www.google.com', '/search', {'q': query})
                      .toString();
                  webViewController.loadUrl(
                    urlRequest: URLRequest(url: WebUri.uri(Uri.parse(url))),
                  );
                }
              },
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest:
            URLRequest(url: WebUri.uri(Uri.parse(homepageUrl))),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            onLoadStart: (controller, url) {
              setState(() {
                searchController.text = url.toString();
              });
            },
            onLoadStop: (controller, url) async {
              setState(() {
                searchController.text = url.toString();
              });
            },
            onProgressChanged: (controller, progress) {
              setState(() {
                this.progress = progress / 100;
              });
            },
          ),
          progress < 1.0
              ? LinearProgressIndicator(value: progress)
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

*/
