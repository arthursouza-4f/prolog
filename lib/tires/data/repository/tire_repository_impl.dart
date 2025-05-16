import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:prolog_app/core/network/dio_exeptions.dart';
import 'package:prolog_app/core/network/dio_suport.dart';

import 'package:prolog_app/tires/data/models/get_all_tires_model.dart';
import 'package:prolog_app/tires/data/models/get_detail_tires_model.dart';
import 'package:prolog_app/tires/domain/repository/tire_repository.dart';
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

  @override
  Future<GetDetailTiresModel> getDetailTires(int id) async {
    try {
      final response = await dio.get('/api/v3/tires/$id');

      print(response);

      GetDetailTiresModel responseModel = GetDetailTiresModel.fromJson(
        response.data,
      );

      return responseModel;
    } on DioException catch (e) {
      throw DioExceptions.fromDioError(e);
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
