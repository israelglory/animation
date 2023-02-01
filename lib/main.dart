import 'package:animation/animation/dragable_card.dart';
import 'package:animation/animation/flipping_contaner.dart';
import 'package:animation/iphone_luncher_animation.dart/iphone_luncher_view.dart';
import 'package:animation/iphone_luncher_animation.dart/iphone_splash/iphone_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IPhoneSplash(),
    );
  }
}
