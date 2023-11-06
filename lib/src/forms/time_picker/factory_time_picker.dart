import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_ukit/models/time_picker_builder.dart';
import 'android_time_picker.dart';
import 'ios_time_picker.dart';

///
/// Renders a dialog based on the [Platform] OS
///
class UKitTimePicker {
  static Future show(
    BuildContext context, {
    required Function(TimeOfDay result) onSave,
    UKitTimePickerBuilder? builder,
    bool forceAndroid = false,
    bool forceIos = false,
    bool format24hour = false,
  }) {
    ///
    /// Define a generic [IDialog]
    Future dialogData;

    ///
    /// [dialogData] will be either a [IosDialog] or [AndroidDialog]
    ///
    if ((Platform.isIOS || Platform.isMacOS || forceIos) && !forceAndroid) {
      dialogData = IosTimePicker.show(
        context: context,
        onSave: onSave,
        as: builder,
        format24hour: format24hour,
      );
    } else if ((Platform.isAndroid || forceAndroid) && !forceIos) {
      dialogData = AndroidTimePicker.show(
        context: context,
        onSave: onSave,
        as: builder,
        format24hour: format24hour,
      );
    } else {
      dialogData = AndroidTimePicker.show(
        context: context,
        onSave: onSave,
        as: builder,
        format24hour: format24hour,
      );
    }

    ///
    /// Show Dialog [dialogData]
    ///
    return dialogData;
  }
}
