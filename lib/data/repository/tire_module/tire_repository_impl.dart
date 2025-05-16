import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:prolog_app/data/dio/dio_exeptions.dart';
import 'package:prolog_app/data/dio/dio_suport.dart';

import 'package:prolog_app/data/models/tire_module/get_all_tires_model.dart';
import 'package:prolog_app/domain/repository/tire_module/tire_repository.dart';
import 'package:provider/provider.dart';

class TireRepositoryImpl extends TireRepository {
  final Dio dio;

  TireRepositoryImpl({Dio? dio, BuildContext? context})
    : dio =
          (context != null
              ? Provider.of<Dio>(context, listen: false)
              : DioSuport().dio);

  TireRepositoryImpl.test({required this.dio});

  @override
  Future<GetAllTiresModel> getAllTires(int pageNumber) async {
    try {
      final response = await dio.get(
        '/api/v3/tires?branchOfficesId=215&pageSize=10&pageNumber=$pageNumber',
      );

      GetAllTiresModel responseModel = GetAllTiresModel.fromJson(response.data);

      return responseModel;
    } on DioException catch (e) {
      throw DioExceptions.fromDioError(e);
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
