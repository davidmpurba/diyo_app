import 'package:diyo/gen/assets.gen.dart';
import 'package:diyo/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        Positioned(
          right: 32,
          top: 16,
          child: Assets.images.logoTranstrack.image(width: 180),
        ),
        const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(),
              Text(
                'RegisT Operational',
                style: TextStyle(
                  fontSize: 14,
                  color: ColorName.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorName.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
