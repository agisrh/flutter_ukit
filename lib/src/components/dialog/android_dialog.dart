import 'package:flutter/material.dart';
import 'package:flutter_ukit/models/ukit_action.dart';
import 'kit_dialog.dart';

///
/// Creates a Android dialog that implements [IDialog]
///
class AndroidDialog implements KitDialog {
  @override
  Widget create(
    Widget title,
    Widget content,
    List<UKitAction> actions,
  ) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions.map(
        (a) {
          return TextButton(
            child: a.child,
            onPressed: a.onPressed as void Function(),
          );
        },
      ).toList(),
    );
  }
}
