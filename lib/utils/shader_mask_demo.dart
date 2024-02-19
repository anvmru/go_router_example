import 'package:flutter/material.dart';

class ShimmerArrows extends StatefulWidget {
  const ShimmerArrows({super.key});

  @override
  State<ShimmerArrows> createState() => _ShimmerArrowsState();
}

class _ShimmerArrowsState extends State<ShimmerArrows>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, child) => ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            transform: _SlideGradientTransforms(percent: 0.7),
            colors: [
              Colors.white10,
              Colors.red,
              Colors.white10,
            ]).createShader(bounds),
        child: child,
      ),
      child: const Column(
        children: [
          Align(heightFactor: .4, child: Icon(Icons.keyboard_arrow_up_sharp)),
          Align(heightFactor: .4, child: Icon(Icons.keyboard_arrow_up_sharp)),
          Align(heightFactor: .4, child: Icon(Icons.keyboard_arrow_up_sharp)),
        ],
      ),
    );
  }
}

class _SlideGradientTransforms extends GradientTransform {
  const _SlideGradientTransforms({required this.percent});
  final double percent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(0, -bounds.height * percent, 0);
  }
}
