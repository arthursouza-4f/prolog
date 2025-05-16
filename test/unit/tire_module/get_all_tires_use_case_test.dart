import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:prolog_app/data/dio/dio_suport.dart';
import 'package:prolog_app/data/models/tire_module/get_all_tires_model.dart';
import 'package:prolog_app/data/repository/tire_module/tire_repository_impl.dart';
import 'package:prolog_app/domain/usecase/tire_module/get_all_tires_use_case.dart';

import '../../../integration_test/mocks/tire_module/tires_mock.dart';
import '../../helpers/dio_adapter_helper.dart';

void main() async {
  final dio = DioSuport().dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dioAdapter = DioAdapter(dio: dio, matcher: const FullHttpRequestMatcher());
  });

  test('Deve retornar uma lista com pneu', () async {
    //Arrange
    //Chama o repositorio com o DIO mockado
    DioAdapterHelper.createDioAdapter(
      dio: dio,
      routes: {
        TiresMock.route: {"statusCode": 200, "data": TiresMock.responseMock1},
      },
    );
    GetAllTiresUseCase useCase = GetAllTiresUseCase(TireRepositoryImpl.test(dio: dio));

    GetAllTiresModel respostaUseCase = await useCase.call(1); //Act

    //Assert
    expect(respostaUseCase.content!.length, 1);
    expect(respostaUseCase.content![0].serialNumber, "PN0001");
    expect(respostaUseCase.content![0].companyGroupName, "Sudeste");
  });
}
