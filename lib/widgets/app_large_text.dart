import 'package:flutter/material.dart';

class AppLargeTexts extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const AppLargeTexts(
      {Key? key, required this.text, this.color = Colors.black, this.size = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
