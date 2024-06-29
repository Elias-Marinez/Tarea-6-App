import 'package:flutter/material.dart';
import 'wavetransition.dart';

class TopHomePage extends StatelessWidget {
  final Color appBarColor;
  final Color backgroundColor;
  final double topHeight;
  final Widget contentWidget;

  const TopHomePage({
    super.key,
    required this.appBarColor,
    required this.backgroundColor,
    required this.topHeight,
    required this.contentWidget
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: topHeight,
          color: appBarColor,
          child: contentWidget,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: WaveTransition(colorTop: appBarColor, colorBottom: backgroundColor),
        ),
      ],
    );
  }
}