import 'package:flutter/material.dart';

import '../../utils/List.dart';
import 'WebView.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Your AIM Cars',
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: CarsList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  // childAspectRatio: 16 / 4,
                ),
                itemBuilder: (context, index) => buildGridTile(
                  context,
                  CarsList[index]['url'],
                  CarsList[index]['name'],
                  CarsList[index]['image'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridTile(
      BuildContext context, String webUrl, String name, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(
              name: name,
              webUrl: webUrl,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 60,
                fit: BoxFit.cover,
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
