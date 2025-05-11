import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';

class AndroidDatePicker {
  static Future show({
    required BuildContext context,
    required Function(DateTime result) onSave,
    DateTime? minDate,
    DateTime? maxDate,
    UKitDatePickerBuilder? as,
  }) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: minDate ?? DateTime(DateTime.now().year - 2),
      lastDate: maxDate ?? DateTime(DateTime.now().year + 2),
      helpText: as?.titleText ?? 'SELECT DATE',
      confirmText: as?.saveText ?? 'SAVE',
      cancelText: as?.cancelText ?? 'CANCEL',
      builder: (context, child) {
        return Theme(
          data: as?.isDarkTheme == true
              ? Theme.of(context).copyWith(
                  colorScheme: ColorScheme.dark(
                    primary: as?.themeColor ?? Colors.blue,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(foregroundColor: as?.themeColor ?? Colors.blue),
                  ),
                )
              : Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: as?.themeColor ?? Colors.blue,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(foregroundColor: as?.themeColor ?? Colors.blue),
                  ),
                ),
          child: child!,
        );
      },
    );
    if (selected != null) {
      onSave(selected);
    }
  }
}
