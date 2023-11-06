import 'package:flutter/material.dart';
import 'ukit_builder.dart';

class UKitDatePickerBuilder extends UKitBuilder {
  UKitDatePickerBuilder({
    this.themeColor,
    this.saveText,
    this.cancelText,
    this.titleText,
  });

  final Color? themeColor;
  final String? saveText;
  final String? cancelText;
  final String? titleText;
}
