import 'package:flutter/material.dart';

class BlockShape extends StatelessWidget {
  final double width;
  final double height;
  final double opacity;
  final String img;
  const BlockShape({
    super.key,
    required this.width,
    required this.height,
    required this.img,
    this.opacity = 0.2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(0),
        image: DecorationImage(
          opacity: opacity,
          image: AssetImage(
            img,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
