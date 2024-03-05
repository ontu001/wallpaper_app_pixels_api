import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_app_pixels_api/screens/widgets/home_grid.dart';
import 'package:wallpaper_app_pixels_api/utilities/constant.dart';

class Walpaper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WalpaperState();
  }
}

class WalpaperState extends State<Walpaper> {
  List images = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataFromApi();
  }

  fetchDataFromApi() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
        headers: {
          'Authorization':
              'FibEFjSnOKT24ereH472YjWE08JOz9fElYOo5EAQACHtw7KNgHzgz2PD'
        }).then((value) {
      Map pixelResult = jsonDecode(value.body);
      setState(() {
        images = pixelResult['photos'];
      });
      print(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeGrid(
              itemcount: images.length,
              itemBuilder: ItemBuilder(builder: (context, index) {
                return Image.network(
                  images[index]['src']['tiny'],
                  fit: BoxFit.cover,
                );
              }),
            ),
            TextButton(
                onPressed: () {},
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
