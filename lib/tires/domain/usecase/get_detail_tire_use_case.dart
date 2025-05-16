import 'package:prolog_app/tires/data/models/get_detail_tires_model.dart';
import 'package:prolog_app/tires/domain/repository/tire_repository.dart';

class GetDetailTireUseCase {
  final TireRepository _tireRepository;

  GetDetailTireUseCase(this._tireRepository);

  Future<GetDetailTiresModel> call(int id) async {
    return await _tireRepository.getDetailTires(id);
  }
}
