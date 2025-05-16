import 'package:flutter_test/flutter_test.dart';

import 'package:prolog_app/core/network/dio_suport.dart';
import 'package:prolog_app/tires/data/models/get_all_tires_model.dart';
import 'package:prolog_app/tires/data/repository/tire_repository_impl.dart';
import 'package:prolog_app/tires/domain/usecase/get_all_tires_use_case.dart';

import '../../../integration_test/mocks/tire_module/tires_mock.dart';
import '../../helpers/dio_adapter_helper.dart';

void main() async {
  final dio = DioSuport().dio;

  test('Deve retornar uma lista com pneu', () async {
    //Arrange
    //Chama o repositorio com o DIO mockado
    DioAdapterHelper.createDioAdapter(
      dio: dio,
      routes: {
        TiresMock.route: {"statusCode": 200, "data": TiresMock.responseMock1},
      },
    );
    GetAllTiresUseCase useCase = GetAllTiresUseCase(
      TireRepositoryImpl.test(dio: dio),
    );

    GetAllTiresModel respostaUseCase = await useCase.call(1); //Act

    //Assert
    expect(respostaUseCase.content!.length, 1);
    expect(respostaUseCase.content![0].serialNumber, "PN0001");
    expect(respostaUseCase.content![0].companyGroupName, "Sudeste");
  });
}
