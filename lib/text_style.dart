import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.color1, this.textData, this.sizeFont, {super.key});
  final String textData;
  final double sizeFont;
  final Color color1;
  @override
  Widget build(context) {
    return Text(
      textData,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Comfortaa',
        color: color1,
        fontSize: sizeFont,
      ),
    );
  }
}
