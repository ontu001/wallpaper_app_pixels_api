import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_app_pixels_api/utilities/constant.dart';

class Walpaper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WalpaperState();
  }
}

class WalpaperState extends State<Walpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        childAspectRatio: 2 / 3,
                    mainAxisSpacing: 2
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        width: 200,
                        color: Colors.red,
                      );
                    })),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Load More",
                  style: kButtonTextStyle,
                )),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
