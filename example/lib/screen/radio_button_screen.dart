import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';
import 'package:flutter_ukit_example/box_widget.dart';

class RadioButtonScreen extends StatefulWidget {
  const RadioButtonScreen({super.key});

  @override
  State<RadioButtonScreen> createState() => _RadioButtonScreenState();
}

class _RadioButtonScreenState extends State<RadioButtonScreen> {
  String _singleValue = "Text alignment right";
  String _verticalGroupValue = "Pending";

  final _status = ["Pending", "Released", "Blocked"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Button'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            BoxWidget(
              title: 'RADIO TEXT ALIGNMENT',
              content: Column(
                children: [
                  UKitRadioButton(
                    description: "Text alignment right",
                    value: "Text alignment right",
                    groupValue: _singleValue,
                    onChanged: (value) {
                      setState(() {
                        _singleValue = value ?? '';
                      });
                    },
                  ),
                  UKitRadioButton(
                    description: "Text alignment left",
                    value: "Text alignment left",
                    groupValue: _singleValue,
                    fillColor: Colors.amber,
                    onChanged: (value) => setState(
                      () => _singleValue = value ?? '',
                    ),
                    textPosition: UKitRadioTextPosition.left,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            BoxWidget(
              title: 'RADIO HORIZONTAL GROUP',
              content: Column(
                children: [
                  UKitRadioGroup<String>.builder(
                    direction: Axis.horizontal,
                    groupValue: _verticalGroupValue,
                    horizontalAlignment: MainAxisAlignment.spaceAround,
                    onChanged: (value) {
                      setState(() {
                        _verticalGroupValue = value ?? '';
                      });
                    },
                    items: _status,
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                    ),
                    itemBuilder: (item) => UKitRadioBuilder(item),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            BoxWidget(
              title: 'RADIO VERTICAL GROUP',
              content: Column(
                children: [
                  UKitRadioGroup<String>.builder(
                    groupValue: _verticalGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _verticalGroupValue = value ?? '';
                      });
                    },
                    items: _status,
                    itemBuilder: (item) => UKitRadioBuilder(item),
                    fillColor: Colors.purple,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            BoxWidget(
              title: 'RADIO SPACE BETWEEN',
              content: Column(
                children: [
                  UKitRadioGroup<String>.builder(
                    groupValue: _verticalGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _verticalGroupValue = value ?? '';
                      });
                    },
                    items: _status,
                    itemBuilder: (item) {
                      return UKitRadioBuilder(
                        item,
                        textPosition: UKitRadioTextPosition.left,
                        spaceBetween: true,
                      );
                    },
                    fillColor: Colors.cyan,
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
