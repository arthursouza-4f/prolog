import 'package:prolog_app/tires/data/models/get_all_tires_model.dart';
import 'package:prolog_app/tires/data/models/get_detail_tires_model.dart';

abstract class TireRepository {
  Future<GetAllTiresModel> getAllTires(int pageNumber);
  Future<GetDetailTiresModel> getDetailTires(int id);
}
