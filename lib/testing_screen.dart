import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FadeSlideText extends StatefulWidget {
  const FadeSlideText({super.key});

  @override
  _FadeSlideTextState createState() => _FadeSlideTextState();
}

class _FadeSlideTextState extends State<FadeSlideText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Fade animation from 0 (invisible) to 1 (fully visible)
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Slide animation from right to left
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Starts outside the right edge
      end: const Offset(0.0, 0.0), // Ends at its normal position
    ).animate(_controller);

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smooth Text Animation')),
      body: Center(
        child: FadeInRight(
            child: const Text(
          "Smooth Transition Text",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )
            // AnimatedBuilder(
            //   animation: _controller,
            //   builder: (context, child) {
            //     return Opacity(
            //       opacity: _fadeAnimation.value, // Apply fade animation
            //       child: const Text(
            //         'Smooth Transition Text',
            //         style: TextStyle(
            //           fontSize: 28,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     );
            //   },
            // ),

            ),
      ),
    );
  }
}
