import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WaveTransition extends StatelessWidget {
  final Color colorTop;
  final Color colorBottom;

  const WaveTransition({
    super.key,
    required this.colorTop,
    required this.colorBottom,
  });

  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        gradients: [
          [colorTop.withOpacity(0.9), colorTop.withOpacity(0.3)],
          [colorBottom.withOpacity(1), colorBottom.withOpacity(1)],
        ],
        durations: [35000, 10000],
        heightPercentages: [0.05, 0.50],
        blur: const MaskFilter.blur(BlurStyle.solid, 10),
        gradientBegin: Alignment.bottomLeft,
        gradientEnd: Alignment.topRight,
      ),
      waveAmplitude: 0,
      size: const Size(double.infinity, 50),
    );
  }
}