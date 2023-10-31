
import 'package:flutter/material.dart';
import 'package:flutter_ukit/models/ukit_action.dart';

abstract class KitActionSheet {
  Widget create(
    BuildContext context,
    Widget title,
    Widget content,
    List<UKitAction> actions,
    UKitAction? cancel,
  );
}
