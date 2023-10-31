import 'package:flutter/material.dart';
import 'package:flutter_ukit/models/ukit_action.dart';

abstract class KitDialog {
  Widget create(
    Widget title,
    Widget content,
    List<UKitAction> actions,
  );
}
