import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DotPatternPainter(),
      child: const SizedBox.expand(),
    );
  }
}

class _DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final background = Paint()..color = AppColors.canvas;
    canvas.drawRect(Offset.zero & size, background);

    final dot = Paint()..color = const Color(0xFFE9E4DA);
    const double spacing = 28;
    const double radius = 1.2;
    for (double y = 16; y < size.height; y += spacing) {
      for (double x = 16; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), radius, dot);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
