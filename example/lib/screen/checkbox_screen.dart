import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';
import 'package:flutter_ukit_example/box_widget.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  List<String> allItemList = [
    'Red',
    'Green',
    'Blue',
    'Yellow',
    'Black',
    'Violet',
  ];

  static List<String> checkedItemList = ['Green', 'Yellow'];
  List<String> selectedItemList = checkedItemList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            BoxWidget(
              title: 'VERTICAL ORIENTATION',
              content: Column(
                children: [
                  UKitCheckbox(
                    itemList: allItemList,
                    checkedItemList: checkedItemList,
                    disabled: const ['Black'],
                    onChanged: (itemList) {
                      setState(() {
                        selectedItemList = itemList;
                        debugPrint('SELECTED ITEM LIST $itemList');
                      });
                    },
                    orientation: CheckboxOrientation.VERTICAL,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            BoxWidget(
              title: 'HORIZONTAL ORIENTATION',
              content: Column(
                children: [
                  UKitCheckbox(
                    itemList: allItemList,
                    checkedItemList: checkedItemList,
                    disabled: const ['Black'],
                    onChanged: (itemList) {
                      setState(() {
                        selectedItemList = itemList;
                        debugPrint('SELECTED ITEM LIST $itemList');
                      });
                    },
                    orientation: CheckboxOrientation.HORIZONTAL,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            BoxWidget(
              title: 'WRAP',
              content: Column(
                children: [
                  UKitCheckbox(
                    wrapSpacing: 10.0,
                    wrapRunSpacing: 15.0,
                    wrapTextDirection: TextDirection.ltr,
                    wrapRunAlignment: WrapAlignment.center,
                    wrapVerticalDirection: VerticalDirection.down,
                    wrapAlignment: WrapAlignment.start,
                    itemList: allItemList,
                    checkedItemList: checkedItemList,
                    disabled: const ['Black'],
                    onChanged: (itemList) {
                      setState(() {
                        selectedItemList = itemList;
                        debugPrint('SELECTED ITEM LIST $itemList');
                      });
                    },
                    orientation: CheckboxOrientation.WRAP,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
