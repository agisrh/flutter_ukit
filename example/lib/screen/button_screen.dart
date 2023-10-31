import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';
import 'package:flutter_ukit_example/box_widget.dart';
import 'package:flutter_ukit_example/styles.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            BoxWidget(
              title: 'BUTTON',
              content: Column(
                children: [
                  UKitButton.solid(
                    as: solidButtonStyles,
                    label: "Button Solid",
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  UKitButton.outlined(
                    as: outlinedButtonStyles,
                    label: "Button Outline",
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  UKitButton.solid(
                    as: solidButtonIconCenterLeft,
                    label: "Button Loading",
                    bgColor: Colors.amber,
                    loading: loading,
                    onPressed: () {
                      setState(() {
                        loading = !loading;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  UKitButton.soft(
                    as: softButtonStyles,
                    color: Colors.purple,
                    label: "Button Soft",
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  UKitButton.outlined(
                    as: disableButtonStyles,
                    label: "Button Disable",
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  UKitButton.solid(
                    as: solidButtonIconCenterLeft,
                    label: "Icon Center Left",
                    bgColor: Colors.indigo,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  UKitButton.solid(
                    as: solidButtonIconCenterRight,
                    label: "Icon Center Right",
                    bgColor: Colors.teal,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  UKitButton.solid(
                    as: solidButtonIconRight,
                    label: "Icon Right",
                    bgColor: Colors.orange,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  UKitButton.solid(
                    as: solidButtonIconLeft,
                    label: "Icon Left",
                    bgColor: Colors.blue,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  UKitButton.solid(
                    as: solidButtonIcon,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  UKitButton.native(
                    label: 'Button Link',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
