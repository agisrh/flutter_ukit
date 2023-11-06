import 'package:flutter/material.dart';
import 'ukit_builder.dart';

class UKitTimePickerBuilder extends UKitBuilder {
  UKitTimePickerBuilder({
    this.themeColor,
    this.saveText,
    this.cancelText,
    this.titleText,
    this.hourLabel,
    this.minuteLabel,
  });

  final Color? themeColor;
  final String? saveText;
  final String? cancelText;
  final String? titleText;
  final String? hourLabel;
  final String? minuteLabel;
}
