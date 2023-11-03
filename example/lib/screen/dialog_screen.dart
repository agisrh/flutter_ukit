import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';
import 'package:flutter_ukit_example/box_widget.dart';
import 'package:flutter_ukit_example/styles.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BoxWidget(
              title: 'DIALOG',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UKitButton.solid(
                    as: solidButtonIconCenterLeft,
                    label: "Open Dialog Option",
                    bgColor: Colors.indigo,
                    onPressed: () {
                      UKitDialog.show(
                        context,
                        title: const Text('Are you sure?'),
                        content: const Text('You cannot reverse this action.'),
                        actions: [
                          UKitAction(
                            child: const Text('YES'),
                            onPressed: () {
                              ///
                              /// Do Something here

                              ///
                              /// Close dialog
                              Navigator.of(context).pop();
                            },
                          ),
                          UKitAction(
                            child: const Text('NO'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20.0),
                  UKitButton.solid(
                    as: solidButtonIconCenterLeft,
                    label: "Open Dialog Confirm",
                    bgColor: Colors.pink,
                    onPressed: () {
                      UKitDialog.show(
                        context,
                        title: const Text('Are you sure?'),
                        content: const Text('You cannot reverse this action.'),
                        actions: [
                          UKitAction(
                            child: const Text('OK'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            BoxWidget(
              title: 'ACTION SHEET',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UKitButton.solid(
                    as: solidButtonIconCenterLeft,
                    label: "Open Action Sheet",
                    bgColor: Colors.teal,
                    onPressed: () {
                      UKitActionSheet.show(
                        context,
                        title: const UKitHeading(
                          text: 'Select you favorite color',
                          color: Colors.blue,
                          textAlign: TextAlign.center,
                          heading: 5,
                        ),
                        content: const Text(
                            'We will use the color on your profile.'),
                        // forceAndroid: true,
                        actions: [
                          UKitAction(
                            child: const Text('Red'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          UKitAction(
                            child: const Text('Green'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          UKitAction(
                            child: const Text('Bue'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          UKitAction(
                            child: const Text('Pink'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                        cancel: UKitAction(
                          child: const UKitHeading(
                            text: 'Cancel',
                            color: Colors.red,
                            heading: 4,
                          ),
                          onPressed: () => debugPrint('Cancel'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            BoxWidget(
              title: 'BOTTOM SHEET',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UKitButton.solid(
                    as: solidButtonIconCenterLeft,
                    label: "Open Bottom Sheet",
                    bgColor: Colors.deepOrange,
                    onPressed: () async {
                      await UKitBottomSheet.show(
                        context: context,
                        floatted: true,
                        hideHead: false,
                        content: Container(
                          alignment: Alignment.center,
                          height: 400,
                          child: const UKitHeading(
                            heading: 3,
                            text: 'Some cool content',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            BoxWidget(
              title: 'BOTTOM SHEET FORM',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UKitButton.solid(
                    as: solidButtonIconCenterLeft,
                    label: "Open Bottom Sheet Form",
                    bgColor: Colors.blue,
                    onPressed: () async {
                      await UKitBottomSheet.show(
                        context: context,
                        floatted: true,
                        hideHead: false,
                        content: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15.0),
                          alignment: Alignment.center,
                          height: 400,
                          child: Column(
                            children: [
                              UKitTextField(
                                as: primaryInput,
                                hint: 'Default',
                                onChanged: (value) => debugPrint(value),
                              ),
                              const SizedBox(height: 15.0),
                              UKitTextField(
                                as: primaryInput,
                                maxLines: 5,
                                hint: 'Default',
                                onChanged: (value) => debugPrint(value),
                              ),
                              const SizedBox(height: 35.0),
                              UKitButton.solid(
                                as: solidButtonIconCenterLeft,
                                label: "Save",
                                bgColor: Colors.indigo,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
