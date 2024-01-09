import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';
import 'package:flutter_ukit_example/styles.dart';
import '../box_widget.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  // The suggest of the current string
  int _currentSuggest = 0;
  // The index of the current string
  int _currentIndex = 0;
  // The index of the current character
  int _currentCharIndex = 0;
  final _suggests = <String>[
    'Search Book',
    'Search Gadget',
    'Search Laptop',
    'Search Shoes',
    'Search Jacket',
    'Search Clothes',
  ];
  String _suggest = "Search";

  void _typingAnimation() {
    setState(() {
      if (_currentCharIndex < _suggest.length) {
        _currentCharIndex++;
      } else {
        _currentIndex = (_currentIndex + 1) % _suggest.length;
        _currentCharIndex = 0;
      }
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      if (_currentCharIndex < _suggest.length) {
        _typingAnimation();
      }
    });
  }

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 5), (_) {
      setState(() {
        if (_currentSuggest < _suggests.length) {
          // _currentSuggest++;
          _suggest = _suggests[_currentSuggest++];
        } else {
          _currentSuggest = 0;
          _suggest = _suggests[_currentSuggest];
        }
        //_suggest = _suggests[_currentSuggest];
        _typingAnimation();
      });
    });

    super.initState();
  }

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
            BoxWidget(
              title: 'TEXTFIELD',
              content: Column(
                children: [
                  UKitTextField(
                    as: primaryInput,
                    hint: _suggest.substring(0, _currentCharIndex),
                    onChanged: (value) {},
                    prefix: const Icon(Icons.search),
                  ),
                  const SizedBox(height: 15.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
