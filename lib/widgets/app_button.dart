import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color color;
  final IconData? icon;
  final String? text;
  final double size;
  final bool? isIcon;
  const AppButton(
      {Key? key,
      this.isIcon = false,
      required this.backgroundColor,
      required this.borderColor,
      required this.size,
      this.icon,
      this.text,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10),
        width: size,
        height: size,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1.0),
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: isIcon == false
              ? AppTexts(
                  text: text!,
                  color: color,
                )
              : Icon(
                  icon,
                  color: color,
                ),
        ));
  }
}
