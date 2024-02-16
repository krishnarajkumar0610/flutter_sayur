import 'package:flutter/material.dart';

class SpecialMethod {
  static Widget text(String text, {Color? color, double? size}) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: size, color: color),
    );
  }

  static Widget positionedText(String text,
      {Color? color,
      double? size,
      double? top,
      double? bottom,
      double? left,
      double? right}) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: size, color: color),
      ),
    );
  }

  static Widget space({double? height, double? width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
