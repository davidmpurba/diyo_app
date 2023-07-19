import 'package:diyo/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class CustomOutlineButtonWidget extends StatelessWidget {
  const CustomOutlineButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.iconAfter,
    this.width,
    this.color = ColorName.primary,
    this.labelStyle,
    this.height,
    this.borderColor,
  });

  final String label;
  final Widget? icon;
  final Widget? iconAfter;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 10,
        ),
        color: color,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? ColorName.netral,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: icon,
              ),
            Text(
              label,
              style: labelStyle,
            ),
            if (iconAfter != null)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: iconAfter,
              ),
          ],
        ),
      ),
    );
  }
}
