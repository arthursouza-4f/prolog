import 'package:flutter/material.dart';

class TextTireStatus extends StatelessWidget {
  const TextTireStatus({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case "INVENTORY":
        return Text(
          "Inventário",
          style: TextStyle(
            color: Color(0xFF1B244B),
            fontWeight: FontWeight.w600,
          ),
        );
      case "ANALYSIS":
        return Text(
          "Análise",
          style: TextStyle(
            color: Color(0xFFD99F00),
            fontWeight: FontWeight.w600,
          ),
        );
      case "INSTALLED":
        return Text(
          "Instalado",
          style: TextStyle(
            color: Color(0xFF138228),
            fontWeight: FontWeight.w600,
          ),
        );
      case "DISPOSAL":
        return Text(
          "Descartado",
          style: TextStyle(
            color: Color(0xFFF24D30),
            fontWeight: FontWeight.w600,
          ),
        );
    }

    return const Text(
      "Desconhecido",
      style: TextStyle(color: Color(0xFF1B244B), fontWeight: FontWeight.w600),
    );
  }
}
