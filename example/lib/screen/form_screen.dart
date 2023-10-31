import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';
import 'package:flutter_ukit_example/box_widget.dart';
import 'package:flutter_ukit_example/styles.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Control'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            BoxWidget(
              title: 'TEXTFIELD',
              content: Column(
                children: [
                  UKitTextField(
                    as: primaryInput,
                    hint: 'Default',
                    onChanged: (value) => debugPrint(value),
                  ),
                  const SizedBox(height: 15.0),
                  UKitTextField(
                    as: primaryInput,
                    hint: 'With Label',
                    label: 'Label Textfield',
                    labelColor: Colors.blue,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 15.0),
                  UKitTextField(
                    as: primaryInput,
                    hint: 'Text Capitalization',
                    textCapitalization: TextCapitalization.characters,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 15.0),
                  UKitTextField(
                    as: primaryInput,
                    hint: 'Max Length',
                    maxLength: 5,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 15.0),
                  UKitTextField(
                    as: disableInput,
                    hint: 'Read Only',
                    readOnly: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 15.0),
                  UKitTextField(
                    as: primaryInput,
                    hint: 'Prefix Icon',
                    onChanged: (value) {},
                    prefix: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(height: 15.0),
                  UKitTextField(
                    as: primaryInput,
                    hint: 'Suffix Icon',
                    onChanged: (value) {},
                    suffix: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(height: 15.0),
                  UKitTextField(
                    as: primaryInput,
                    hint: 'Obsecure Text',
                    obscureText: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 15.0),
                  UKitTextField(
                    as: primaryInput,
                    hint: 'Show Hide Password',
                    showObscureSwitch: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 15.0),
                  UKitTextField.native(
                    hint: 'Native',
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 15.0),
                  UKitTextField(
                    as: underlineInput,
                    hint: 'Underline',
                    obscureText: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 15.0),
                  UKitTextField(
                    as: primaryInput,
                    hint: 'Max Lines',
                    maxLines: 5,
                    onChanged: (value) {},
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
