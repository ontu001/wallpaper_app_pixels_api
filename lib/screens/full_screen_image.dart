import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FullScreenState();
  }
}

class FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        ),
      ),
    );
  }
}
