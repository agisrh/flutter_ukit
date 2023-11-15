import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';
import 'package:flutter_ukit_example/box_widget.dart';
import 'package:flutter_ukit_example/styles.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BoxWidget(
              title: 'BOX MESSAGE',
              content: Column(
                children: [
                  UKitContainer(
                    as: infoContainer,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UKitHeading(
                          text: 'Info Container',
                          heading: 6,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  UKitContainer(
                    as: successContainer,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UKitHeading(
                          text: 'Success Container',
                          heading: 6,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  UKitContainer(
                    as: warningContainer,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UKitHeading(
                          text: 'Warning Container',
                          heading: 6,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  UKitContainer(
                    as: errorContainer,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UKitHeading(
                          text: 'Error Container',
                          heading: 6,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        ),
                      ],
                    ),
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
