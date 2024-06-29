import 'package:flutter/material.dart';

import 'wavetransition.dart';

class TopHomePageWithImage extends StatelessWidget {
  final Color _appBarColor;
  final Color _backgroundColor;
  final double _topHeight;
  final String _imagePath;

  const TopHomePageWithImage({
    super.key,
    required Color appBarColor,
    required Color backgroundColor,
    required double topHeight,
    required String imagePath,
  })  : _appBarColor = appBarColor,
        _backgroundColor = backgroundColor,
        _topHeight = topHeight,
        _imagePath = imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: _topHeight,
          color: _appBarColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  _imagePath,
                  fit: BoxFit.contain,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: WaveTransition(colorTop: _appBarColor, colorBottom: _backgroundColor),
        ),
      ],
    );
  }
}