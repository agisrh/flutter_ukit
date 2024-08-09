import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';

// ORIENTATION
// ignore: constant_identifier_names
enum CheckboxOrientation { HORIZONTAL, VERTICAL, WRAP, SPACE_BETWEEN }

class UKitCheckbox extends StatefulWidget {
  final List<String> itemList;
  final List<String>? displayList;
  final List<String>? checkedItemList;
  final List<String> disabled;

  final UKitCheckboxBuilder? as;

  /// Specifies the orientation of the elements in itemList.
  final CheckboxOrientation orientation;

  /// Called when the value of the checkbox group changes.
  final Function onChanged;

  /// If true the checkbox's value can be true, false, or null.
  final bool tristate;

  /// Label Position.
  final bool labelStart;

  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize? materialTapTargetSize;

  //.......................WRAP ORIENTATION.....................................
  final Axis wrapDirection;
  final WrapAlignment wrapAlignment;

  /// Defaults to 0.0.
  final double wrapSpacing;
  final WrapAlignment wrapRunAlignment;

  /// Defaults to 0.0.
  final double wrapRunSpacing;
  final WrapCrossAlignment wrapCrossAxisAlignment;
  final TextDirection? wrapTextDirection;
  final VerticalDirection wrapVerticalDirection;

  const UKitCheckbox({
    super.key,
    required this.itemList,
    this.displayList,
    required this.orientation,
    required this.onChanged,
    this.checkedItemList,
    this.as,
    this.disabled = const [],
    this.materialTapTargetSize,
    this.tristate = false,
    this.labelStart = false,
    this.wrapDirection = Axis.horizontal,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapSpacing = 0.0,
    this.wrapRunAlignment = WrapAlignment.start,
    this.wrapRunSpacing = 0.0,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
    this.wrapTextDirection,
    this.wrapVerticalDirection = VerticalDirection.down,
  });

  @override
  State<UKitCheckbox> createState() => _UKitCheckboxState();
}

class _UKitCheckboxState extends State<UKitCheckbox> {
  List<String> selectedListItems = [];

  @override
  Widget build(BuildContext context) {
    Widget finalWidget = generateItems();
    return finalWidget;
  }

  // GENERATE ITEMS
  Widget generateItems() {
    List<Widget> content = [];
    Widget finalWidget;
    if (widget.checkedItemList != null) {
      selectedListItems = widget.checkedItemList!;
    }
    List<Widget> widgetList = [];
    for (int i = 0; i < widget.itemList.length; i++) {
      widgetList.add(item(i));
    }
    if (widget.orientation == CheckboxOrientation.VERTICAL) {
      for (final item in widgetList) {
        content.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[item],
          ),
        );
      }
      finalWidget = SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: content),
      );
    } else if (widget.orientation == CheckboxOrientation.HORIZONTAL) {
      for (final item in widgetList) {
        content.add(Column(children: <Widget>[item]));
      }
      finalWidget = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: content),
      );
    } else {
      finalWidget = SingleChildScrollView(
        child: Wrap(
          spacing: widget.wrapSpacing,
          runSpacing: widget.wrapRunSpacing,
          textDirection: widget.wrapTextDirection ?? TextDirection.ltr,
          crossAxisAlignment: widget.wrapCrossAxisAlignment,
          verticalDirection: widget.wrapVerticalDirection,
          alignment: widget.wrapAlignment,
          direction: Axis.horizontal,
          runAlignment: widget.wrapRunAlignment,
          children: widgetList,
        ),
      );
    }
    return finalWidget;
  }

  // ITEM
  Widget item(int index) {
    return Row(
      mainAxisSize: widget.orientation == CheckboxOrientation.SPACE_BETWEEN ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: widget.orientation == CheckboxOrientation.SPACE_BETWEEN
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: <Widget>[
        // POSITION LABEL START
        if (widget.labelStart)
          Text(
            widget.displayList != null
                ? widget.displayList![index].isEmpty
                    ? ''
                    : widget.displayList![index]
                : widget.itemList[index].isEmpty
                    ? ''
                    : widget.itemList[index],
            style: widget.disabled.contains(widget.itemList.elementAt(index))
                ? TextStyle(color: Theme.of(context).disabledColor)
                : widget.as?.textStyle,
          ),
        Checkbox(
          activeColor: widget.as?.activeColor ?? Colors.blue,
          checkColor: widget.as?.checkColor ?? Colors.white,
          focusColor: widget.as?.focusColor,
          hoverColor: widget.as?.hoverColor,
          materialTapTargetSize: widget.materialTapTargetSize,
          value: selectedListItems.contains(widget.itemList[index]),
          tristate: widget.tristate,
          onChanged: (selected) {
            if (widget.disabled.contains(widget.itemList.elementAt(index))) {
              return;
            } else {
              selected ?? false
                  ? selectedListItems.add(widget.itemList[index])
                  : selectedListItems.remove(widget.itemList[index]);
              setState(() {
                widget.onChanged(selectedListItems);
              });
            }
          },
        ),
        // POSITION LABEL END
        if (!widget.labelStart)
          Text(
            widget.displayList != null
                ? widget.displayList![index].isEmpty
                    ? ''
                    : widget.displayList![index]
                : widget.itemList[index].isEmpty
                    ? ''
                    : widget.itemList[index],
            style: widget.disabled.contains(widget.itemList.elementAt(index))
                ? TextStyle(color: Theme.of(context).disabledColor)
                : widget.as?.textStyle,
          )
      ],
    );
  }
}
