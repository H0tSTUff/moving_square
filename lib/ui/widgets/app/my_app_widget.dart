import 'package:flutter/material.dart';
import 'package:moving_square/ui/widgets/home_screen/square_animation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Padding(
        padding: EdgeInsets.all(32.0),
        child: SquareAnimation(),
      ),
    );
  }
}
