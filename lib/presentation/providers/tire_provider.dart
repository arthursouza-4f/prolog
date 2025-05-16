import 'package:flutter/material.dart';
import 'package:prolog_app/data/repository/tire_module/tire_repository_impl.dart';
import 'package:prolog_app/domain/usecase/tire_module/get_all_tires_use_case.dart';
import 'package:prolog_app/presentation/store/tire_module/tire_screen_store.dart';

class TireProvider extends ChangeNotifier {
  late TireScreenStore tireScreenStore;

  TireProvider(BuildContext context) {
    tireScreenStore = TireScreenStore(
      GetAllTiresUseCase(TireRepositoryImpl(context: context)),
    );
  }
} 