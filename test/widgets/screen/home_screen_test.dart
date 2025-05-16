import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prolog_app/presentation/screen/home_screen.dart';

void main() {
  testWidgets(
    'Verifica se a HomeScreen está sendo renderizada com modulo de gestão de pneus',
    (tester) async {
      //Inicializando a tela - Arrange
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      //Procura o titulo e a imagem na tela - Act
      final titleFinder = find.text("Gestão de pneus");
      final imageFinder = find.byType(Image);

      //Executa a ação de verificacao realmente - Act
      expect(titleFinder, findsOneWidget);
      expect(imageFinder, findsOneWidget);
    },
  );
}
