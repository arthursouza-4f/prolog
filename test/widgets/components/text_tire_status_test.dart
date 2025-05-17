import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prolog_app/tires/presentation/component/text_tire_status.dart';

void main() {
  group('Teste component status reativo', () {
    testWidgets("Status inventario", (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: TextTireStatus(status: "INVENTORY")),
        ),
      );

      // Act
      final textFinder = find.text("Inventário");
      final colorFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.style?.color == const Color(0xFF1B244B) &&
            widget.style?.fontWeight == FontWeight.w600,
      );

      // Assert
      expect(textFinder, findsOneWidget);
      expect(colorFinder, findsOneWidget);
    });

    testWidgets("Status analise", (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: TextTireStatus(status: "ANALYSIS")),
        ),
      );

      // Act
      final textFinder = find.text("Análise");
      final colorFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.style?.color == const Color(0xFFD99F00) &&
            widget.style?.fontWeight == FontWeight.w600,
      );

      // Assert
      expect(textFinder, findsOneWidget);
      expect(colorFinder, findsOneWidget);
    });

    testWidgets("Status instalado", (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: TextTireStatus(status: "INSTALLED")),
        ),
      );

      // Act
      final textFinder = find.text("Instalado");
      final colorFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.style?.color == const Color(0xFF138228) &&
            widget.style?.fontWeight == FontWeight.w600,
      );

      // Assert
      expect(textFinder, findsOneWidget);
      expect(colorFinder, findsOneWidget);
    });

    testWidgets("Status descartado", (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: TextTireStatus(status: "DISPOSAL")),
        ),
      );

      // Act
      final textFinder = find.text("Descartado");
      final colorFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.style?.color == const Color(0xFFF24D30) &&
            widget.style?.fontWeight == FontWeight.w600,
      );

      // Assert
      expect(textFinder, findsOneWidget);
      expect(colorFinder, findsOneWidget);
    });

    testWidgets("Status desconhecido", (tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: TextTireStatus(status: "DESCONHECIDO")),
        ),
      );

      // Act
      final textFinder = find.text("Desconhecido");
      final colorFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.style?.color == const Color(0xFF1B244B) &&
            widget.style?.fontWeight == FontWeight.w600,
      );

      // Assert
      expect(textFinder, findsOneWidget);
      expect(colorFinder, findsOneWidget);
    });
  });
}
