import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  final String title;
  final String? description;
  final Widget content;
  const BoxWidget({
    super.key,
    required this.title,
    this.description,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (description != null) const SizedBox(height: 5),
          if (description != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                description!,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          const Divider(thickness: 1),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [const SizedBox(height: 5.0), content],
            ),
          ),
          const SizedBox(height: 10.0)
        ],
      ),
    );
  }
}
