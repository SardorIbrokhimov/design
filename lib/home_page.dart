import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id="home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                ),
              ],
            ),
            Divider(),

          ],
        ),
      ),
    );
  }
}
