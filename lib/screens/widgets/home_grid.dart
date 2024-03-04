import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 2),
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: 200,
                color: Colors.red,
              );
            }));
  }
}
