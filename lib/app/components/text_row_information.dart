import 'package:flutter/material.dart';

class TextRowInformation extends StatelessWidget {
  const TextRowInformation({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: TextStyle(color: Color(0xFF1D2549))),
        Text(
          value,
          style: TextStyle(
            color: Color(0xFF1D2549),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
