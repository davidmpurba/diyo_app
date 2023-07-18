
import 'package:flutter/material.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({
    super.key,
    required this.text,
    required this.color,
    this.borderColor = Colors.transparent,
  });

  final String text;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: borderColor, width: 2),
            ),
          ),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
