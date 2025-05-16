import 'package:prolog_app/tires/data/models/get_all_tires_model.dart';
import 'package:prolog_app/tires/domain/repository/tire_repository.dart';

class GetAllTiresUseCase {
  final TireRepository _tireRepository;

  GetAllTiresUseCase(this._tireRepository);

  Future<GetAllTiresModel> call(int pageNumber) async {
    return await _tireRepository.getAllTires(pageNumber);
  }
}
