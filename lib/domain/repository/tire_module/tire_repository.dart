import 'package:prolog_app/data/models/tire_module/get_all_tires_model.dart';

abstract class TireRepository {
  Future<GetAllTiresModel> getAllTires(int pageNumber);
}
