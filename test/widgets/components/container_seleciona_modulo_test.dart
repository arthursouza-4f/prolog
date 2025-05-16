import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prolog_app/presentation/components/container_seleciona_modulo.dart';

void main() {
  testWidgets(
    'Verifica se o componente de selecionar modulo está sendo renderizado',
    (tester) async {
      //Inicializando o componente - Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ContainerSelecionaModulo(
              title: 'Teste',
              imagePath: 'assets/imgs/gestao_pneu/icon_home_screen.png',
            ),
          ),
        ),
      );

      //Procura o titulo e a imagem no componente - Act
      final titleFinder = find.byKey(Key('container_seleciona_modulo'));
      final imageFinder = find.byType(Image);

      //Executa a ação de verificacao realmente - Assert
      expect(titleFinder, findsOneWidget);
      expect(imageFinder, findsOneWidget);
    },
  );
}
