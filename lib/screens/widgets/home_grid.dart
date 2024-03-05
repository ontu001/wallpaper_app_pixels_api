import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeGrid extends StatelessWidget {
  final int itemcount;
  final ItemBuilder itemBuilder;

  const HomeGrid({super.key, required this.itemcount, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            itemCount: itemcount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 2),
            itemBuilder: itemBuilder.builder,
            ));
  }
}


class ItemBuilder {
  final Widget Function(BuildContext context, int index) builder;

  const ItemBuilder({required this.builder});
}
