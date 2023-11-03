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
        mainAxisAlignment: this.textPosition == UKitRadioTextPosition.right
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: <Widget>[
          this.textPosition == UKitRadioTextPosition.left
              ? Expanded(
                  child: Text(
                    this.description,
                    style: this.textStyle,
                    textAlign: TextAlign.right,
                  ),
                )
              : const SizedBox.shrink(),
          Radio<T>(
            groupValue: groupValue,
            onChanged: this.onChanged,
            value: this.value,
            activeColor: activeColor,
            fillColor:
                fillColor != null ? MaterialStateProperty.all(fillColor) : null,
          ),
          this.textPosition == UKitRadioTextPosition.right
              ? Expanded(
                  child: Text(
                    this.description,
                    style: this.textStyle,
                    textAlign: TextAlign.left,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
