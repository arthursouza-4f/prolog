import 'package:mobx/mobx.dart';

import 'package:prolog_app/tires/data/models/get_detail_tires_model.dart';
import 'package:prolog_app/tires/domain/usecase/get_detail_tire_use_case.dart';

part 'detail_tire_screen_store.g.dart';

class DetailTireScreenStore = _DetailTireScreenStore
    with _$DetailTireScreenStore;

abstract class _DetailTireScreenStore with Store {
  final GetDetailTireUseCase _getDetailTireUseCase;

  _DetailTireScreenStore(this._getDetailTireUseCase);

  @observable
  GetDetailTiresModel detailTireModel = GetDetailTiresModel();

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  Future<void> getDetailTire(int id) async {
    isLoading = true;
    try {
      GetDetailTiresModel result = await _getDetailTireUseCase.call(id);
      detailTireModel = result;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
