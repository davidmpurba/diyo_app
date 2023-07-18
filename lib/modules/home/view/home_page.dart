import 'package:diyo/gen/assets.gen.dart';
import 'package:diyo/utils/font.dart';
import 'package:diyo/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Assets.images.logo.image(width: 100,height: 100),
        backgroundColor: Colors.white,
      ),
      drawer: const NavBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle
              ),
            )
          ],
        ),
      ),
    );
  }
}

