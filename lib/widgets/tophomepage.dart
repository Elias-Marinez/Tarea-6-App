import 'package:flutter/material.dart';
import 'wavetransition.dart';

class TopHomePage extends StatelessWidget {
  final Color _appBarColor;
  final Color _backgroundColor;
  final double _topHeight;
  final IconData _icon;
  final String _title;

  const TopHomePage({
    super.key,
    required Color appBarColor,
    required Color backgroundColor,
    required double topHeight,
    required IconData icon,
    required String title,
  })  : _appBarColor = appBarColor,
        _backgroundColor = backgroundColor,
        _topHeight = topHeight,
        _icon = icon,
        _title = title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: _topHeight,
          color: _appBarColor,
          padding: const EdgeInsets.all(45.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                _icon,
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 10.0), // Adjust this value as needed
                child: Text(
                  _title,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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