import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class FullScreen extends StatefulWidget {
  final String imageUrl;

  const FullScreen({super.key, required this.imageUrl});
  @override
  State<StatefulWidget> createState() {
    return FullScreenState();
  }
}

class FullScreenState extends State<FullScreen> {
  Future<void>setWalpaper() async {
    int location = WallpaperManager.BOTH_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
    bool resut = await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () =>setWalpaper(), child: Icon(Icons.settings),elevation: 0,),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Image.network(widget.imageUrl,fit: BoxFit.cover,),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
