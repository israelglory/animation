import 'package:animation/iphone_luncher_animation.dart/iphone_luncher_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class IPhoneSplash extends StatefulWidget {
  const IPhoneSplash({super.key});

  @override
  State<IPhoneSplash> createState() => _IPhoneSplashState();
}

class _IPhoneSplashState extends State<IPhoneSplash>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    final curve =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _animation = Tween<double>(begin: 50, end: 90).animate(curve);
    _controller.repeat();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 7));
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const IphoneLuncherView();
        },
      ));
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? _) {
          return Image.asset(
            'assets/icons/iphonewhite.png',
            height: _animation.value,
            width: _animation.value,
          );
        },
      )),
    );
  }
}
