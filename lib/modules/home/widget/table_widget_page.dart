import 'package:diyo/utils/font.dart';
import 'package:diyo/utils/functions.dart';
import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
  });

  final String text;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: textColor(color)),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: body1(color: textColor(color)),
        ),
      ),
    );
  }
}
