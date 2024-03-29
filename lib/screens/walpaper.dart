import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_app_pixels_api/screens/full_screen_image.dart';
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
  int page = 1;
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
    });
  }

  loadMore() async {
    setState(() {
      page = page + 1;
    });
    String url =
        "https://api.pexels.com/v1/curated?per_page=80&page=" + page.toString();
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          'FibEFjSnOKT24ereH472YjWE08JOz9fElYOo5EAQACHtw7KNgHzgz2PD'
    }).then((value) {
      Map moreImage = jsonDecode(value.body);
      setState(() {
        images = moreImage['photos'];
      });
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
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>FullScreen(imageUrl: images[index]['src']['large2x'],)));
                  },
                  child: Image.network(
                    images[index]['src']['tiny'],
                    fit: BoxFit.cover,
                  ),
                );
              }),
            ),
            TextButton(
                onPressed: () {
                  loadMore();
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
