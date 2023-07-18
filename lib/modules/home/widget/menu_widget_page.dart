import 'package:diyo/utils/font.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: body1(color: Colors.white),
        ),
      ),
    );
  }
}