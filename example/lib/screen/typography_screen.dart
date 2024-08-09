import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';
import 'package:flutter_ukit_example/box_widget.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typography'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BoxWidget(
              title: 'HEADINGS',
              description:
                  'You can use style fontWeight, color, textAlign, overflow, fontFamily, style and maxLines',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UKitHeading(
                    text: 'Heading 1',
                    heading: 1,
                  ),
                  UKitHeading(
                    text: 'Heading 2',
                    heading: 2,
                  ),
                  UKitHeading(
                    text: 'Heading 3',
                    heading: 3,
                  ),
                  UKitHeading(
                    text: 'Heading 4',
                    heading: 4,
                  ),
                  UKitHeading(
                    text: 'Heading 5',
                    heading: 5,
                  ),
                  UKitHeading(
                    text: 'Heading 6',
                    heading: 6,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
