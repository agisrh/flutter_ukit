import 'package:flutter/material.dart';
import 'ukit_builder.dart';

class UKitButtonBuilder extends UKitBuilder {
  /// Sets the button's border color
  Color? borderColor;

  /// Sets the button's border radius
  double? borderRadius;

  /// Sets the button's border width
  double? borderWidth;

  /// Sets the button's elevation
  double? elevation;

  /// Sets the button's shadow color
  Color? shadowColor;

  /// Sets the button's label color
  Color? labelColor;

  /// Sets the button's background color
  Color? bgColor;

  /// Sets the button's size percentage
  double? widthFactor;

  /// Sets the button's padding
  EdgeInsets? padding;

  /// Sets icon place
  IconPlace? iconPlace;

  UKitButtonBuilder({
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.elevation,
    this.labelColor,
    this.bgColor,
    this.widthFactor,
    this.padding,
    this.shadowColor,
    this.iconPlace,
  });
}

enum IconPlace { left, right, centerLeft, centerRight }
