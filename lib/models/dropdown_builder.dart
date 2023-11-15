import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit_utils.dart';
import 'ukit_builder.dart';

class UKitDropdownBuilder extends UKitBuilder {
  final double? borderRadius;
  final UKitBorderType? borderType;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? errorBorderColor;
  final double? borderWidth;
  final double? padding;
  final double? elevation;
  final Color? bgColor;
  final Color? labelColor;
  final Color? selectedColor;
  final Color? dropdownColor;

  final FloatingLabelBehavior? floatingLabelBehavior;

  UKitDropdownBuilder({
    this.borderRadius,
    this.borderType,
    this.borderColor,
    this.focusBorderColor,
    this.errorBorderColor,
    this.borderWidth,
    this.padding,
    this.elevation,
    this.bgColor,
    this.labelColor,
    this.selectedColor,
    this.dropdownColor,
    this.floatingLabelBehavior,
  });
}
