import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prolog_app/tires/data/repository/tire_repository_impl.dart';
import 'package:prolog_app/tires/domain/usecase/get_all_tires_use_case.dart';
import 'package:prolog_app/app/components/container_no_conection.dart';
import 'package:prolog_app/app/components/error_component.dart';
import 'package:prolog_app/tires/presentation/component/text_tire_status.dart';
import 'package:prolog_app/tires/presentation/screen/detail_tires_screen.dart';
import 'package:prolog_app/core/store/conection_store.dart';
import 'package:prolog_app/tires/presentation/store/tire_screen_store.dart';
import 'package:sizer/sizer.dart';
import 'package:prolog_app/app/components/text_row_information.dart';

class TiresScreen extends StatefulWidget {
  const TiresScreen({super.key});

  @override
  State<TiresScreen> createState() => _TiresScreenState();
}

class _TiresScreenState extends State<TiresScreen> {
  final ConectionStore _connectivityStore = ConectionStore();
  late TireScreenStore _tireScreenStore;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      _tireScreenStore = TireScreenStore(
        GetAllTiresUseCase(TireRepositoryImpl(context: context)),
      );
      _tireScreenStore.getAllTires(_tireScreenStore.pageNumber);
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gestão de pneus',
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
            return ContainerNoConection();
          }

          //Loading
          if (_tireScreenStore.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                key: Key("progress_bar"),
                color: Color(0xFF3C5ED9),
              ),
            );
          }

          //Mostra mensagem de erro
          if (_tireScreenStore.errorMessage.isNotEmpty) {
            return ErrorComponent(message: _tireScreenStore.errorMessage);
          }

          if (_tireScreenStore.tireCards.content == null ||
              _tireScreenStore.tireCards.content!.isEmpty) {
            return Center(child: Text('Nenhum pneu encontrado'));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  key: Key("tire_list"),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  itemCount: _tireScreenStore.tireCards.content!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => DetailTiresScreen(
                                    tireId:
                                        _tireScreenStore
                                            .tireCards
                                            .content![index]
                                            .id!,
                                  ),
                            ),
                          ),
                      child: Container(
                        key: Key('tireCard$index'),
                        margin: EdgeInsets.only(bottom: 15),
                        width: 95.w,
                        constraints: BoxConstraints(minHeight: 145),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(color: Color(0xFFE7E7E7)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: 85.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 45.w,
                                    child: TextRowInformation(
                                      text: "Serial: ",
                                      value: _tireScreenStore.tireCards.content![index].serialNumber ?? '',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40.w,
                                    child: Wrap(
                                      alignment: WrapAlignment.end,
                                      children: [
                                        Text(
                                          "Empresa: ",
                                          style: TextStyle(
                                            color: Color(0xFF1D2549),
                                          ),
                                        ),
                                        Text(
                                          _tireScreenStore
                                                  .tireCards
                                                  .content![index]
                                                  .companyGroupName ??
                                              '',
                                          style: TextStyle(
                                            color: Color(0xFF1D2549),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              width: 85.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 45.w,
                                    child: TextRowInformation(
                                      text: "DOT: ",
                                      value: _tireScreenStore.tireCards.content![index].dot ?? '',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40.w,
                                    child: Wrap(
                                      alignment: WrapAlignment.end,
                                      children: [
                                        Text(
                                          "Filial: ",
                                          style: TextStyle(
                                            color: Color(0xFF1D2549),
                                          ),
                                        ),
                                        Text(
                                          _tireScreenStore
                                                  .tireCards
                                                  .content![index]
                                                  .branchOfficeName ??
                                              '',
                                          style: TextStyle(
                                            color: Color(0xFF1D2549),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              width: 85.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Status: ",
                                          style: TextStyle(
                                            color: Color(0xFF1D2549),
                                          ),
                                        ),
                                        TextTireStatus(
                                          status:
                                              _tireScreenStore
                                                  .tireCards
                                                  .content![index]
                                                  .status!,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: TextRowInformation(
                                      text: "Tamanho: ",
                                      value: '${_tireScreenStore.tireCards.content![index].tireSize!.width}/${_tireScreenStore.tireCards.content![index].tireSize!.height}',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              width: 85.w,
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                children: [
                                  Text(
                                    "Modelo: ",
                                    style: TextStyle(color: Color(0xFF1D2549)),
                                  ),
                                  Text(
                                    _tireScreenStore
                                            .tireCards
                                            .content![index]
                                            .model!
                                            .name ??
                                        '',
                                    style: TextStyle(
                                      color: Color(0xFF1D2549),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  margin: EdgeInsets.only(bottom: 5.h),
                  width: 95.w,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _tireScreenStore.tireCards.pageNumber! >= 2
                          ? GestureDetector(
                            key: Key('previousPageButton'),
                            onTap: () {
                              _tireScreenStore.setPageNumberOneLess();
                            },
                            child: Container(
                              width: 30.w,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFF3C5ED9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                              ),
                            ),
                          )
                          : SizedBox(),
                      _tireScreenStore.tireCards.lastPage! == false
                          ? GestureDetector(
                            key: Key('nextPageButton'),
                            onTap: () {
                              _tireScreenStore.setPageNumberOneMore();
                            },
                            child: Container(
                              width: 30.w,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFF3C5ED9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                            ),
                          )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
