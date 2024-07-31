import 'package:bookly/constant.dart';
import 'package:bookly/core/utils/routes.dart';
import 'package:bookly/features/splash/presentation/views/widgets/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController control;
  late Animation<Offset> sliding;

  @override
  void initState() {
    initAnimation();
    super.initState();
    homeNavigator();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    control.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          kLogo,
          scale: 0.5,
        ),
        AnimatedText(sliding: sliding),
      ],
    );
  }

  void initAnimation() {
    control = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    control.forward();
    sliding = Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
        .animate(control);
  }

  void homeNavigator() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).push(Routes.home);
      },
    );
  }
}
