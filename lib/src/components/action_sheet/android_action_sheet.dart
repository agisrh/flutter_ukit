import 'package:flutter/material.dart';
import 'package:flutter_ukit/models/ukit_action.dart';
import 'kit_action_sheet.dart';

///
/// Creates a Android dialog that implements [IDialog]
///
class AndroidActionSheet implements KitActionSheet {
  @override
  Widget create(
    BuildContext context,
    Widget title,
    Widget content,
    List<UKitAction> actions,
    UKitAction? cancel,
  ) {
    return BottomSheet(
      onClosing: () {},
      builder: (_) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              title,
              const SizedBox(height: 10),
              content,
              const SizedBox(height: 40),
              Column(
                children: actions.map(
                  (action) {
                    return _button(action);
                  },
                ).toList(),
              ),
              _cancelButton(context, cancel!),
            ],
          ),
        );
      },
    );
  }

  Widget _button(UKitAction action) {
    return Column(
      children: [
        const Divider(height: 1),
        MaterialButton(
          minWidth: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: action.child,
          onPressed: action.onPressed as void Function(),
        ),
      ],
    );
  }

  Widget _cancelButton(BuildContext context, UKitAction cancel) {
    return Column(
      children: [
        const Divider(),
        MaterialButton(
          minWidth: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: cancel.child,
          onPressed: () {
            cancel.onPressed as void Function();
            Navigator.pop(context, 'Cancel');
          },
        ),
      ],
    );
  }
}
