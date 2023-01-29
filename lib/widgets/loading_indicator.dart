import 'package:flutter/material.dart';
import 'dart:math';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  );
  late final _rotationAnimation = Tween<double>(
    begin: 0,
    end: 2 * pi,
  ).animate(_controller);

  @override
  void initState() {
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotationAnimation,
      builder: (_, __) {
        return Transform.rotate(
          angle: _rotationAnimation.value,
          child: const CustomPaint(
            painter: LoadingPainter(color: Colors.white, radius: 20),
            size: Size(20, 20),
          ),
        );
      },
    );
  }
}

class LoadingPainter extends CustomPainter {
  final Color color;
  final double radius;

  const LoadingPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(Offset.zero & size, -pi / 2, 0.8 * 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(LoadingPainter oldDelegate) {
    return color != oldDelegate.color || radius != oldDelegate.radius;
  }
}
