import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_app_pixels_api/screens/widgets/home_grid.dart';
import 'package:wallpaper_app_pixels_api/services/fetch_data.dart';
import 'package:wallpaper_app_pixels_api/utilities/constant.dart';

class Walpaper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WalpaperState();
  }
}

class WalpaperState extends State<Walpaper> {
  final FetchData fetchdata = FetchData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeGrid(),
            TextButton(
                onPressed: () {
                  fetchdata.fetchDataFromApi();
                },
                child: Text(
                  "Load More..",
                  style: kButtonTextStyle,
                )),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
