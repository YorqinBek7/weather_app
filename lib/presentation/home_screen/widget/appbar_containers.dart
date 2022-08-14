import 'package:flutter/material.dart';

class AppBarContainers extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  const AppBarContainers(
      {super.key,
      required this.height,
      required this.width,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.black,
      ),
    );
  }
}
