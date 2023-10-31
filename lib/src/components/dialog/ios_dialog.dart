import 'package:flutter/cupertino.dart';
import 'package:flutter_ukit/models/ukit_action.dart';
import 'kit_dialog.dart';

///
/// Creates a Cupertino dialog that implements [IDialog]
///
class IosDialog implements KitDialog {
  @override
  Widget create(
    Widget title,
    Widget content,
    List<UKitAction> actions,
  ) {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: actions.map<Widget>(
        (a) {
          return CupertinoButton(
            child: a.child,
            onPressed: a.onPressed as void Function(),
          );
        },
      ).toList(),
    );
  }
}
