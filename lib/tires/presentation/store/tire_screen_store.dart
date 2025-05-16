import 'package:mobx/mobx.dart';

import 'package:prolog_app/tires/data/models/get_all_tires_model.dart';
import 'package:prolog_app/tires/domain/usecase/get_all_tires_use_case.dart';

part 'tire_screen_store.g.dart';

class TireScreenStore = _TireScreenStore with _$TireScreenStore;

abstract class _TireScreenStore with Store {
  final GetAllTiresUseCase _getAllTiresUseCase;

  _TireScreenStore(this._getAllTiresUseCase);

  @observable
  GetAllTiresModel tireCards = GetAllTiresModel();

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @observable
  int pageNumber = 1;

  @action
  void setPageNumberOneMore() {
    isLoading = true;
    pageNumber++;
    tireCards = GetAllTiresModel();
    getAllTires(pageNumber);
  }

  @action
  void setPageNumberOneLess() {
    isLoading = true;
    pageNumber--;
    tireCards = GetAllTiresModel();
    getAllTires(pageNumber);
  }

  @action
  Future<void> getAllTires(int pageNumber) async {
    isLoading = true;
    tireCards = GetAllTiresModel();
    try {
      GetAllTiresModel result = await _getAllTiresUseCase.call(pageNumber);
      tireCards = result;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
    } finally {
      isLoading = false;
    }
  }
}
