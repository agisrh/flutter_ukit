import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';
import '../box_widget.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            BoxWidget(
              title: 'LOADER',
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UKitLoader.circular(
                      as: UKitLoaderBuilder(color: Colors.pink)),
                  const SizedBox(width: 20.0),
                  UKitLoader.circular(
                    as: UKitLoaderBuilder(
                      color: Colors.green,
                      bgColor: Colors.amber,
                    ),
                    scale: 0.8,
                  ),
                  const SizedBox(width: 20.0),
                  const UKitLoaderMultiColor(),
                  const SizedBox(width: 20.0),
                  UKitLoader.circular(withBackgorund: true),
                  const SizedBox(width: 20.0),
                  const UKitLoaderMultiColor(withBackgorund: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
