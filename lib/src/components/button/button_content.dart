// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit_utils.dart';
import 'package:flutter_ukit/models/button_builder.dart';
import 'package:flutter_ukit/src/contents/typography.dart';

/// Button Content
Widget UKitButtonContent(
  UKitButtonBuilder? as,
  String? label,
  Color? labelColor,
  TextStyle? labelStyle,
  Widget? icon,
) {
  if (label == null) {
    return Center(
      child: icon,
    );
  } else {
    switch (as?.iconPlace) {
      case IconPlace.LEFT:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            Expanded(
              child: Center(
                child: UIButtonLabel(as, label, labelColor, labelStyle),
              ),
            ),
          ],
        );

      case IconPlace.CENTER_LEFT:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            const SizedBox(width: 8.0),
            UIButtonLabel(as, label, labelColor, labelStyle),
          ],
        );

      case IconPlace.RIGHT:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: UIButtonLabel(as, label, labelColor, labelStyle),
              ),
            ),
            icon ?? const SizedBox.shrink(),
          ],
        );

      case IconPlace.CENTER_RIGHT:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIButtonLabel(as, label, labelColor, labelStyle),
            const SizedBox(width: 8.0),
            icon ?? const SizedBox.shrink(),
          ],
        );

      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: UIButtonLabel(as, label, labelColor, labelStyle),
              ),
            ),
            icon ?? const SizedBox.shrink(),
          ],
        );
    }
  }
}

/// Button Label
Widget UIButtonLabel(
  UKitButtonBuilder? as,
  String? label,
  Color? labelColor,
  TextStyle? labelStyle,
) {
  if (labelStyle != null) {
    return Text(label!, style: labelStyle);
  } else {
    return UKitHeading(
      text: label!,
      color: UKitUtils.getColor(as, as?.labelColor, labelColor, Colors.blue),
      heading: 6,
    );
  }
}

Widget UKitButtonLoading(UKitButtonBuilder? as, Color? labelColor) {
  return SizedBox(
    height: 20,
    width: 20,
    child: CircularProgressIndicator(
      strokeWidth: 2.5,
      color: UKitUtils.getColor(as, as?.labelColor, labelColor, Colors.blue),
    ),
  );
}
