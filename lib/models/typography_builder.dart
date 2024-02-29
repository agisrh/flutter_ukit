import 'package:flutter/material.dart';
import 'ukit_builder.dart';

class UKitHeadingBuilder extends UKitBuilder {
  UKitHeadingBuilder({
    this.color,
    this.fontFamily,
    this.fontWeight,
    this.fontSize,
    this.heading,
    this.style,
  });

  final Color? color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final int? heading;
  final TextStyle? style;
}
