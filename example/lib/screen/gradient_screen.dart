import 'package:flutter/material.dart';
import 'package:flutter_ukit_example/box_widget.dart';

class GradientScreen extends StatelessWidget {
  const GradientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gradient'),
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
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.purple,
                          Colors.blueAccent,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Welcome to my app',
                        style: TextStyle(fontSize: 24),
                      ),
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
