import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_ukit/models/ukit_action.dart';
import './android_dialog.dart';
import 'kit_dialog.dart';
import './ios_dialog.dart';

///
/// Renders a dialog based on the [Platform] OS
///
class UKitDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    Widget? title,
    Widget? content,
    List<UKitAction>? actions,
    bool forceAndroid = false,
    bool forceIos = false,
    bool dismissible = true,
  }) {
    ///
    /// Define a generic [IDialog]
    KitDialog dialogData;

    ///
    /// [dialogData] will be either a [IosDialog] or [AndroidDialog]
    ///
    if ((Platform.isIOS || Platform.isMacOS || forceIos) && !forceAndroid) {
      dialogData = IosDialog();
    } else if ((Platform.isAndroid || forceAndroid) && !forceIos) {
      dialogData = AndroidDialog();
    } else {
      dialogData = AndroidDialog();
    }

    ///
    /// Show Dialog [dialogData]
    ///
    return showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) => dialogData.create(
        title ?? const Text('Untitled'),
        content ?? const Text('Content missing.'),
        actions ?? [],
      ),
    );
  }
}
