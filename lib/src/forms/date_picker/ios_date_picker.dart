import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';

class IosDatePicker {
  static Future show({
    required BuildContext context,
    required Function(DateTime result) onSave,
    DateTime? minDate,
    DateTime? maxDate,
    UKitDatePickerBuilder? as,
  }) async {
    final DateTime? selected = await showCupertinoModalPopup(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext builder) {
          return Container(
            height: context.screenHeight * 0.25,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 5.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          as?.cancelText ?? 'Cancel',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          as?.cancelText ?? 'Done',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: as?.themeColor ?? Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (value) {
                      onSave(value);
                    },
                    initialDateTime: DateTime.now(),
                    minimumDate: minDate,
                    maximumDate: maxDate,
                  ),
                ),
              ],
            ),
          );
        });
    if (selected != null) {
      onSave(selected);
    }
  }
}
