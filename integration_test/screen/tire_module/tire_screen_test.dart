import 'package:dio/dio.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:prolog_app/core/network/dio_suport.dart';
import 'package:prolog_app/tires/presentation/screen/tires_screen.dart';

import '../../../test/helpers/dio_adapter_helper.dart';
import '../../mocks/tire_module/tires_mock.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final dio = DioSuport().dio;

  group('teste de integracao - tires screen', () {
    testWidgets("Verifica se pneu apareceu na tela", (teste) async {
      //Cria os mocks das rotas
      DioAdapterHelper.createDioAdapter(
        dio: dio,
        routes: {
          TiresMock.route: {"statusCode": 200, "data": TiresMock.responseMock1},
          TiresMock.route2: {
            "statusCode": 200,
            "data": TiresMock.responseMock2,
          },
        },
      );

      await teste.pumpWidget(
        Provider<Dio>(
          create: (_) => dio,
          child: Sizer(
            builder: (context, orientation, deviceType) {
              return const MaterialApp(home: TiresScreen());
            },
          ),
        ),
      );

      expect(find.byKey(Key("progress_bar")), findsOneWidget);

      expect(find.byKey(Key("tire_list")), findsNothing);

      await teste.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(Key("tireCard0")), findsOneWidget);

      await teste.tap(find.byKey(Key("nextPageButton")));

      await teste.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(Key("tireCard0")), findsOneWidget);

      await teste.tap(find.byKey(Key("previousPageButton")));

      await teste.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byKey(Key("tireCard0")), findsOneWidget);

      expect(find.byKey(Key("previousPageButton")), findsNothing);
    });

    testWidgets("Verifica se mensagem de erro apareceu na tela", (teste) async {
      //Cria os mocks das rotas
      DioAdapterHelper.createDioAdapter(
        dio: dio,
        routes: {
          TiresMock.route: {"statusCode": 400, "data": {}},
        },
      );

      await teste.pumpWidget(
        Provider<Dio>(
          create: (_) => dio,
          child: Sizer(
            builder: (context, orientation, deviceType) {
              return const MaterialApp(home: TiresScreen());
            },
          ),
        ),
      );

      await teste.pumpAndSettle(const Duration(seconds: 2));

      final erroTitleMessage = find.text("Oops!");
      final erroDescriptionMessage = find.text("Requisição inválida");
      final imageFinder = find.byType(Image);

      expect(erroTitleMessage, findsOneWidget);
      expect(erroDescriptionMessage, findsOneWidget);
      expect(imageFinder, findsOneWidget);
    });

    testWidgets("Verifica se mensagem nenhum pneu encontrado aparece na tela", (
      teste,
    ) async {
      //Cria os mocks das rotas
      DioAdapterHelper.createDioAdapter(
        dio: dio,
        routes: {
          TiresMock.route: {
            "statusCode": 200,
            "data": TiresMock.responseMockVazio,
          },
        },
      );

      await teste.pumpWidget(
        Provider<Dio>(
          create: (_) => dio,
          child: Sizer(
            builder: (context, orientation, deviceType) {
              return const MaterialApp(home: TiresScreen());
            },
          ),
        ),
      );

      await teste.pumpAndSettle(const Duration(seconds: 2));

      final erroTitleMessage = find.text("Nenhum pneu encontrado");

      expect(erroTitleMessage, findsOneWidget);
    });
  });
}
