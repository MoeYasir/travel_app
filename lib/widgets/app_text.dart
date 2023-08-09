import 'package:flutter/material.dart';

class AppTexts extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  const AppTexts(
      {Key? key,
      required this.text,
      this.fontWeight,
      this.color = Colors.black54,
      this.size = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: size,
      ),
    );
  }
}
