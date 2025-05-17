import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF1B244B),
            fontWeight: FontWeight.w700,
          ),
        ),
        Divider(thickness: 2),
      ],
    );
  }
}
