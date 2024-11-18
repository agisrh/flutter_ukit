import 'package:flutter/material.dart';
import 'package:flutter_ukit/models/radio_builder.dart';
export 'package:flutter_ukit/models/radio_builder.dart';

class UKitRadioButton<T> extends StatelessWidget {
  final String description;
  final T value;
  final T groupValue;
  final void Function(T?)? onChanged;
  final UKitRadioTextPosition textPosition;
  final Color? activeColor;
  final Color? fillColor;
  final TextStyle? textStyle;
  final bool spaceBetween;

  const UKitRadioButton({
    super.key,
    required this.description,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.textPosition = UKitRadioTextPosition.right,
    this.activeColor,
    this.fillColor,
    this.textStyle,
    this.spaceBetween = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.onChanged != null) {
          this.onChanged!(value);
        }
      },
      child: Row(
        mainAxisAlignment: (this.textPosition == UKitRadioTextPosition.right && this.spaceBetween == false)
            ? MainAxisAlignment.start
            : (this.textPosition == UKitRadioTextPosition.left && this.spaceBetween == false)
                ? MainAxisAlignment.end
                : MainAxisAlignment.spaceBetween,
        children: <Widget>[
          this.textPosition == UKitRadioTextPosition.left
              ? Expanded(
                  child: Text(
                    this.description,
                    style: this.textStyle,
                    textAlign: spaceBetween ? null : TextAlign.right,
                  ),
                )
              : const SizedBox.shrink(),
          Radio<T>(
            groupValue: groupValue,
            onChanged: this.onChanged,
            value: this.value,
            activeColor: activeColor,
            fillColor: fillColor != null ? WidgetStateProperty.all(fillColor) : null,
          ),
          this.textPosition == UKitRadioTextPosition.right
              ? Expanded(
                  child: Text(
                    this.description,
                    style: this.textStyle,
                    textAlign: spaceBetween ? TextAlign.right : TextAlign.left,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
