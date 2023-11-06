import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';
import 'package:flutter_ukit_example/box_widget.dart';
import 'package:flutter_ukit_example/styles.dart';

class PickerScreen extends StatelessWidget {
  const PickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            BoxWidget(
              title: 'DATE PICKER',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UKitButton.solid(
                    as: solidButtonIconCenterLeft,
                    label: "Date Picker Android",
                    bgColor: Colors.green,
                    onPressed: () {
                      UKitDatePicker.show(
                        context,
                        forceAndroid: true,
                        onSave: (result) {},
                      );
                    },
                  ),
                  const SizedBox(height: 20.0),
                  UKitButton.solid(
                    as: solidButtonIconCenterLeft,
                    label: "Date Picker iOS",
                    bgColor: Colors.pink,
                    onPressed: () {
                      UKitDatePicker.show(
                        context,
                        forceIos: true,
                        onSave: (result) {},
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            BoxWidget(
              title: 'TIME PICKER',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UKitButton.solid(
                    as: solidButtonIconCenterLeft,
                    label: "Time Picker Android",
                    bgColor: Colors.blue,
                    onPressed: () {
                      UKitTimePicker.show(
                        context,
                        forceAndroid: true,
                        onSave: (result) {},
                      );
                    },
                  ),
                  const SizedBox(height: 20.0),
                  UKitButton.solid(
                    as: solidButtonIconCenterLeft,
                    label: "Time Picker iOS",
                    bgColor: Colors.teal,
                    onPressed: () {
                      UKitTimePicker.show(
                        context,
                        forceIos: true,
                        onSave: (result) {},
                      );
                    },
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
