import 'package:flutter/material.dart';

enum CustomDialogType { success, normal, warning, error, custom }

/// All the Colors used in the Dialog themes
class CustomDialogColors {
  /// <h3>Hex Code: #61D800</h3>
  static Color success = const Color(0xFF61D800);

  /// <h3>Hex Code: #179DFF</h3>
  static Color normal = const Color(0xFF179DFF);

  /// <h3>Hex Code: #FF8B17</h3>
  static Color warning = const Color(0xFFFF8B17);

  /// <h3>Hex Code: #FF4D17</h3>
  static Color error = const Color(0xFFFF4D17);

  /// <h3>Hex Code: #707070</h3>
  static Color defaultTextColor = const Color(0xFF707070);
}

Color getCustomDialogColor({
  required CustomDialogType customDialogType,
  Color? defaultColor,
}) {
  switch (customDialogType) {
    case CustomDialogType.normal:
      return CustomDialogColors.normal;
    case CustomDialogType.success:
      return CustomDialogColors.success;
    case CustomDialogType.warning:
      return CustomDialogColors.warning;
    case CustomDialogType.error:
      return CustomDialogColors.error;
    default:
      return defaultColor ?? const Color(0xFF179DFF);
  }
}
