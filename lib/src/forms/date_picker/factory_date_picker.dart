import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_ukit/models/date_picker_builder.dart';
import 'android_date_picker.dart';
import 'ios_date_picker.dart';

///
/// Renders a dialog based on the [Platform] OS
///
class UKitDatePicker {
  static Future show(
    BuildContext context, {
    required Function(DateTime result) onSave,
    UKitDatePickerBuilder? builder,
    DateTime? minDate,
    DateTime? maxDate,
    bool forceAndroid = false,
    bool forceIos = false,
  }) {
    ///
    /// Define a generic [IDialog]
    Future dialogData;

    ///
    /// [dialogData] will be either a [IosDialog] or [AndroidDialog]
    ///
    if ((Platform.isIOS || Platform.isMacOS || forceIos) && !forceAndroid) {
      dialogData = IosDatePicker.show(
        context: context,
        minDate: minDate,
        maxDate: maxDate,
        onSave: onSave,
        as: builder,
      );
    } else if ((Platform.isAndroid || forceAndroid) && !forceIos) {
      dialogData = AndroidDatePicker.show(
        context: context,
        minDate: minDate,
        maxDate: maxDate,
        onSave: onSave,
        as: builder,
      );
    } else {
      dialogData = AndroidDatePicker.show(
        context: context,
        minDate: minDate,
        maxDate: maxDate,
        onSave: onSave,
        as: builder,
      );
    }

    ///
    /// Show Dialog [dialogData]
    ///
    return dialogData;
  }
}
