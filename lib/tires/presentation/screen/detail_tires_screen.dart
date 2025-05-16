import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prolog_app/tires/data/repository/tire_repository_impl.dart';
import 'package:prolog_app/tires/domain/usecase/get_detail_tire_use_case.dart';
import 'package:prolog_app/app/components/container_sem_conexao.dart';
import 'package:prolog_app/app/components/error_component.dart';
import 'package:prolog_app/core/store/conection_store.dart';
import 'package:prolog_app/tires/presentation/store/detail_tire_screen_store.dart';
import 'package:sizer/sizer.dart';

class DetailTiresScreen extends StatefulWidget {
  const DetailTiresScreen({super.key, required this.tireId});

  final int tireId;

  @override
  State<DetailTiresScreen> createState() => _DetailTiresScreenState();
}

class _DetailTiresScreenState extends State<DetailTiresScreen> {
  final ConectionStore _connectivityStore = ConectionStore();
  late DetailTireScreenStore _detailtireScreenStore;

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      _detailtireScreenStore = DetailTireScreenStore(
        GetDetailTireUseCase(TireRepositoryImpl(context: context)),
      );
      _detailtireScreenStore.getDetailTire(widget.tireId);
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhes do Pneu: ${widget.tireId}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF3C5ED9),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Observer(
        builder: (_) {
          //Verifica se a pessoa está conecta a internet
          if (!_connectivityStore.isConnected) {
            return ContainerSemConexao();
          }

          //Loading
          if (_detailtireScreenStore.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                key: Key("progress_bar"),
                color: Color(0xFF3C5ED9),
              ),
            );
          }

          //Mostra mensagem de erro
          if (_detailtireScreenStore.errorMessage.isNotEmpty) {
            return ErrorComponent(message: _detailtireScreenStore.errorMessage);
          }

          return Center(
            child: Container(
              margin: EdgeInsets.all(15),
              width: 95.w,
              color: Colors.red,
              child: Column(children: [
              


                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
