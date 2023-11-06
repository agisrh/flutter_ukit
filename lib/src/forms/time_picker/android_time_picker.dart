import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';

class AndroidTimePicker {
  static Future show({
    required BuildContext context,
    required Function(TimeOfDay result) onSave,
    bool? format24hour,
    UKitTimePickerBuilder? as,
  }) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: as?.titleText ?? 'SELECT TIME',
      confirmText: as?.saveText ?? 'SAVE',
      cancelText: as?.cancelText ?? 'CANCEL',
      hourLabelText: as?.hourLabel ?? 'Hour',
      minuteLabelText: as?.minuteLabel ?? 'Minute',
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(alwaysUse24HourFormat: format24hour ?? false),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: as?.themeColor ?? Colors.blue,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor: as?.themeColor ?? Colors.blue),
              ),
            ),
            child: child!,
          ),
        );
      },
    );
    if (selected != null) {
      onSave(selected);
    }
  }
}
