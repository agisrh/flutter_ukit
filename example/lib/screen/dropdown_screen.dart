import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';
import 'package:flutter_ukit_example/box_widget.dart';

import '../styles.dart';

class DropdownScreen extends StatelessWidget {
  const DropdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<UKitDropdownOption> options = [
      UKitDropdownOption(text: 'Option 1', value: 1),
      UKitDropdownOption(text: 'Option 2', value: 2),
      UKitDropdownOption(text: 'Option 3', value: 3),
      UKitDropdownOption(text: 'Option 4', value: 4),
      UKitDropdownOption(text: 'Option 5', value: 5),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            BoxWidget(
              title: 'DROPDOWN OPTION',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UKitDropdown(
                    hint: "Search",
                    as: dropdownInput,
                    options: options,
                    onChanged: (val) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
