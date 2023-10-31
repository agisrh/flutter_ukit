import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ukit/models/ukit_action.dart';
import 'android_action_sheet.dart';
import 'kit_action_sheet.dart';
import 'ios_action_sheet.dart';

///
/// Renders a dialog based on the [Platform] OS
///
class UKitActionSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    Widget? title,
    Widget? content,
    List<UKitAction>? actions,
    UKitAction? cancel,
    bool forceAndroid = false,
    bool forceIos = false,
  }) {
    ///
    /// Define a generic [IDialog]
    KitActionSheet dialogData;

    ///
    /// [dialogData] will be either a [IosDialog] or [AndroidDialog]
    ///
    if ((Platform.isIOS || forceIos || Platform.isMacOS) && !forceAndroid) {
      dialogData = IosActionSheet();
    } else if ((Platform.isAndroid || forceAndroid) && !forceIos) {
      dialogData = AndroidActionSheet();
    } else {
      dialogData = AndroidActionSheet();
    }

    ///
    /// Show Dialog [dialogData]
    ///
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => dialogData.create(
        context,
        title ?? const Text('Untitled'),
        content ?? const Text('Content missing.'),
        actions ?? [],
        cancel,
      ),
    );
  }
}
