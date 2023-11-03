import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit_utils.dart';
import 'package:flutter_ukit/models/button_builder.dart';
import 'button_content.dart';

class UKitButton {
  /// Outlined Button
  static Widget outlined({
    UKitButtonBuilder? as,
    String? label,
    Color? labelColor,
    TextStyle? labelStyle,
    required Function onPressed,
    Color? borderColor,
    Color? bgColor,
    double? borderRadius,
    double? borderWidth,
    double? elevation,
    double? widthFactor,
    Widget? icon,
    bool loading = false,
  }) {
    return FractionallySizedBox(
      widthFactor: UKitUtils.getDouble(as, as?.widthFactor, widthFactor, 1.0),
      child: OutlinedButton(
        onPressed: onPressed as void Function(),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            as?.padding ?? const EdgeInsets.all(15.0),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) return Colors.black12;
              if (states.contains(MaterialState.hovered)) return Colors.black12;
              if (states.contains(MaterialState.pressed)) return Colors.black12;
              return null; // Defer to the widget's default.
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return UKitUtils.getColor(as, as?.bgColor, bgColor, Colors.blue);
            },
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                UKitUtils.getDouble(as, as?.borderRadius, borderRadius, 0.0),
              ),
            ),
          ),
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
              return BorderSide(
                width:
                    UKitUtils.getDouble(as, as?.borderWidth, borderWidth, 2.0),
                color: UKitUtils.getColor(
                    as, as?.borderColor, borderColor, Colors.transparent),
              );
            },
          ),
        ),
        child: FractionallySizedBox(
          child: loading
              ? UKitButtonLoading(as, labelColor)
              : UKitButtonContent(as, label, labelColor, labelStyle, icon),
        ),
      ),
    );
  }

  /// Solid Button
  static Widget solid({
    UKitButtonBuilder? as,
    String? label,
    Color? labelColor,
    TextStyle? labelStyle,
    required Function onPressed,
    Color? bgColor,
    double? borderRadius,
    double? elevation,
    double? widthFactor,
    Widget? icon,
    Color? shadowColor,
    bool loading = false,
  }) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: UKitUtils.getDouble(as, as?.widthFactor, widthFactor, 1.0),
      child: TextButton(
        onPressed: onPressed as void Function(),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            as?.padding ?? const EdgeInsets.all(15.0),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) return Colors.black12;
              if (states.contains(MaterialState.hovered)) return Colors.black12;
              if (states.contains(MaterialState.pressed)) return Colors.black12;
              return null; // Defer to the widget's default.
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return UKitUtils.getColor(as, as?.bgColor, bgColor, Colors.blue);
            },
          ),
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              return UKitUtils.getDouble(as, as?.elevation, elevation, 1.0);
            },
          ),
          shadowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return UKitUtils.getColor(
                  as, as?.shadowColor, shadowColor, Colors.black);
            },
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                UKitUtils.getDouble(as, as?.borderRadius, borderRadius, 0.0),
              ),
            ),
          ),
        ),
        child: loading
            ? UKitButtonLoading(as, labelColor)
            : UKitButtonContent(as, label, labelColor, labelStyle, icon),
      ),
    );
  }

  /// Soft Button
  static Widget soft({
    UKitButtonBuilder? as,
    String? label,
    TextStyle? labelStyle,
    required Function onPressed,
    required Color color,
    double? borderRadius,
    double? elevation,
    double? widthFactor,
    Widget? icon,
    Color? shadowColor,
    bool loading = false,
  }) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: UKitUtils.getDouble(as, as?.widthFactor, widthFactor, 1.0),
      child: TextButton(
        onPressed: onPressed as void Function(),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            as?.padding ?? const EdgeInsets.all(15.0),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) return Colors.black12;
              if (states.contains(MaterialState.hovered)) return Colors.black12;
              if (states.contains(MaterialState.pressed)) return Colors.black12;
              return null; // Defer to the widget's default.
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return UKitUtils.getColor(
                  as, as?.bgColor, color.withOpacity(0.2), Colors.blue);
            },
          ),
          shadowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return UKitUtils.getColor(
                  as, as?.shadowColor, shadowColor, color);
            },
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                UKitUtils.getDouble(as, as?.borderRadius, borderRadius, 0.0),
              ),
            ),
          ),
        ),
        child: loading
            ? UKitButtonLoading(as, color)
            : UKitButtonContent(as, label, color, labelStyle, icon),
      ),
    );
  }

  ///
  /// Native Buttons
  ///
  static Widget native({
    Function? onPressed,
    String? label,
    Color? labelColor,
    Color? bgColor,
    double? widthFactor,
  }) {
    if (Platform.isIOS) {
      return FractionallySizedBox(
        widthFactor: widthFactor,
        child: CupertinoButton(
          color: bgColor,
          onPressed: onPressed as void Function()?,
          child: Text(
            label!,
            style: TextStyle(
              color: labelColor,
            ),
          ),
        ),
      );
    } else {
      return FractionallySizedBox(
        widthFactor: widthFactor,
        child: TextButton(
          onPressed: onPressed as void Function()?,
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
          ),
          child: Text(
            label!,
            style: TextStyle(
              color: labelColor ?? Colors.black,
            ),
          ),
        ),
      );
    }
  }
}
