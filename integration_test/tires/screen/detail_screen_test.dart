import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:prolog_app/core/network/dio_suport.dart';
import 'package:prolog_app/tires/presentation/screen/detail_tires_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../test/helpers/dio_adapter_helper.dart';
import '../mocks/tires_mock.dart';

void main() {
  group("Tela detalhamento de pneus - Integracao", () {
    final dio = DioSuport().dio;

    testWidgets("Apareceu itens na tela", (teste) async {
      await mockNetworkImagesFor(() async {
        DioAdapterHelper.createDioAdapter(
          dio: dio,
          routes: {
            TiresMock.routeDetailTireInstalled: {
              "statusCode": 200,
              "data": TiresMock.responseDetailTireInstalled,
            },
          },
        );

        await teste.pumpWidget(
          Provider<Dio>(
            create: (_) => dio,
            child: Sizer(
              builder: (context, orientation, deviceType) {
                return const MaterialApp(home: DetailTiresScreen(tireId: 1234));
              },
            ),
          ),
        );

        expect(find.byKey(Key("progress_bar")), findsOneWidget);

        await teste.pumpAndSettle(const Duration(seconds: 2));

        final textFinder = find.text("Instalado");
        final textStatusFinderColor = find.byWidgetPredicate(
          (widget) =>
              widget is Text &&
              widget.style?.color == const Color(0xFF138228) &&
              widget.style?.fontWeight == FontWeight.w600,
        );
        final textSerial = find.text("1016");
        final textCurrentRetread = find.text("Recapagem atual");

        expect(textFinder, findsOneWidget);
        expect(textStatusFinderColor, findsOneWidget);
        expect(textSerial, findsOneWidget);
        expect(textCurrentRetread, findsOneWidget);

        await teste.drag(find.byType(Scrollable).first, const Offset(0, -300));

        await teste.pumpAndSettle(const Duration(seconds: 2));

        final imagePhoto = find.byKey(Key("tire_photo_0"));

        expect(imagePhoto, findsOneWidget);

        await teste.tap(imagePhoto);

        await teste.pumpAndSettle(const Duration(seconds: 2));

        expect(find.byKey(Key("modal_image")), findsOneWidget);
      });
    });

    testWidgets("Abril motivo descarte e abrir fotos dentro do modal", (
      teste,
    ) async {
      await mockNetworkImagesFor(() async {
        DioAdapterHelper.createDioAdapter(
          dio: dio,
          routes: {
            TiresMock.routeDetailTireDisposalWithPhothos: {
              "statusCode": 200,
              "data": TiresMock.responseDetailTireDisposalWithPhothos,
            },
          },
        );

        await teste.pumpWidget(
          Provider<Dio>(
            create: (_) => dio,
            child: Sizer(
              builder: (context, orientation, deviceType) {
                return const MaterialApp(
                  home: DetailTiresScreen(tireId: 12345),
                );
              },
            ),
          ),
        );

        expect(find.byKey(Key("progress_bar")), findsOneWidget);

        await teste.pumpAndSettle(const Duration(seconds: 2));

        await teste.tap(find.byKey(Key("disposal_button")));

        await teste.pumpAndSettle(const Duration(seconds: 2));

        expect(find.byKey(Key("modal_disposal")), findsOneWidget);

        final textFinder = find.text("Motivo");
        final photoFinder = find.byKey(Key("disposal_photo_0"));

        expect(textFinder, findsOneWidget);
        expect(photoFinder, findsOneWidget);

        await teste.tap(photoFinder);

        await teste.pumpAndSettle(const Duration(seconds: 2));

        expect(find.byKey(Key("modal_image")), findsOneWidget);
      });
    });
  });
}
