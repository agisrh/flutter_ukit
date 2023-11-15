import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';
import 'dropdown_form.dart';

class UKitDropdownOption {
  final String text;
  final dynamic value;

  UKitDropdownOption({required this.text, required this.value});
}

/// Simple dorpdown whith plain text as a dropdown items.
class UKitDropdown extends StatelessWidget {
  final List<UKitDropdownOption> options;
  final UKitDropdownOption? initialValue;
  //final InputDecoration? decoration;
  final UKitDropdownController<UKitDropdownOption>? controller;
  final void Function(dynamic item)? onChanged;
  final void Function(UKitDropdownOption?)? onSaved;
  final String? Function(UKitDropdownOption?)? validator;
  final String? emptyText;
  final String? hint;
  final String? label;
  final bool Function(UKitDropdownOption item, String str)? filterFn;
  final Future<List<UKitDropdownOption>> Function(String str)? findFn;
  final double? dropdownHeight;
  final Widget? suffix;
  final Widget? prefix;
  final UKitDropdownBuilder? as;

  const UKitDropdown({
    Key? key,
    required this.options,
    this.initialValue,
    this.onSaved,
    this.controller,
    this.onChanged,
    this.validator,
    this.emptyText,
    this.hint,
    this.label,
    this.findFn,
    this.filterFn,
    this.dropdownHeight,
    this.prefix,
    this.suffix,
    this.as,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UKitDropdownFormField<UKitDropdownOption>(
      as: as,
      emptyText: emptyText,
      label: label,
      prefix: prefix,
      suffix: suffix,
      onSaved: onSaved,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      dropdownHeight: dropdownHeight,
      displayItemFn: (dynamic item) {
        var newItem = item;
        newItem ??= initialValue;
        return Text(
          newItem != null
              ? newItem.text
              : (label == null && hint != null && newItem == null)
                  ? hint
                  : "",
          style: TextStyle(
            fontSize: 16,
            color: newItem == null ? Colors.grey.shade600 : Colors.black87,
          ),
        );
      },
      findFn: findFn ?? (dynamic str) async => options,
      filterFn: filterFn ??
          (dynamic item, str) =>
              item.text.toLowerCase().contains(str.toLowerCase()),
      dropdownItemFn: (dynamic item, position, focused, selected, onTap) =>
          ListTile(
        title: Text(
          item.text,
          style:
              TextStyle(color: selected ? as!.selectedColor : Colors.black87),
        ),
        tileColor:
            focused ? const Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
        onTap: onTap,
      ),
    );
  }
}
