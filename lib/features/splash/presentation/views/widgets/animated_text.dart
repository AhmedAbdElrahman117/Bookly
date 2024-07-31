import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key, required this.sliding});
  final Animation<Offset> sliding;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return SlideTransition(
          position: sliding,
          child: Center(child: Text('Animation')),
        );
      },
      animation: sliding,
    );
  }
}
