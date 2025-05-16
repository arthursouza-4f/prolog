import 'package:prolog_app/data/models/tire_module/get_all_tires_model.dart';
import 'package:prolog_app/domain/repository/tire_module/tire_repository.dart';

class GetAllTiresUseCase {
  final TireRepository _tireRepository;

  GetAllTiresUseCase(this._tireRepository);

  Future<GetAllTiresModel> call(int pageNumber) async {
    return await _tireRepository.getAllTires(pageNumber);
  }
}
