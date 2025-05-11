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
            color: as?.isDarkTheme == true ? Colors.black : Colors.white,
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
                    child: CupertinoTheme(
                  data: CupertinoThemeData(
                    brightness: as?.isDarkTheme == true ? Brightness.dark : Brightness.light,
                    primaryColor: as?.isDarkTheme == true ? Colors.white : Colors.black,
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                          color: as?.isDarkTheme == true ? Colors.white : as?.themeColor ?? Colors.black), // Warna teks
                    ),
                  ),
                  child: CupertinoDatePicker(
                    backgroundColor: as?.isDarkTheme == true ? Colors.black : Colors.white,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (value) {
                      onSave(value);
                    },
                    initialDateTime: DateTime.now(),
                    minimumDate: minDate,
                    maximumDate: maxDate,
                  ),
                )),
              ],
            ),
          );
        });
    if (selected != null) {
      onSave(selected);
    }
  }
}
