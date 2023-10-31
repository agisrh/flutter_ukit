import 'package:flutter/material.dart';
import 'ukit_defaults.dart';

class UKitContainerDefaults extends UKitDefaults {
  ///
  /// Set the UIContainer background color
  final Color? color;

  ///
  /// Set the UIContainer custom padding
  final EdgeInsetsGeometry? padding;

  ///
  /// Set the UIContainer border radius
  final double? borderRadius;

  ///
  /// Set the UIContainer shadow
  final BoxShadow? shadow;

  ///
  /// Set the UIContainer border width
  final double? borderWidth;

  ///
  /// Set the UIContainer border color
  final Color? borderColor;

  final double? widthFactor;

  UKitContainerDefaults({
    this.color,
    this.padding,
    this.borderRadius,
    this.shadow,
    this.borderWidth,
    this.borderColor,
    this.widthFactor,
  });
}
