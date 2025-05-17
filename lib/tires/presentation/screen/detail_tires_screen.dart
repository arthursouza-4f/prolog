import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:prolog_app/app/components/text_row_information.dart';
import 'package:prolog_app/app/components/text_section.dart';
import 'package:prolog_app/tires/data/models/get_detail_tires_model.dart';
import 'package:prolog_app/tires/data/repository/tire_repository_impl.dart';
import 'package:prolog_app/tires/domain/usecase/get_detail_tire_use_case.dart';
import 'package:prolog_app/app/components/container_no_conection.dart';
import 'package:prolog_app/app/components/error_component.dart';
import 'package:prolog_app/core/store/conection_store.dart';
import 'package:prolog_app/tires/presentation/component/text_tire_status.dart';
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
            return ContainerNoConection();
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

          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15),
              width: 95.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _detailtireScreenStore.detailTireModel.status! == "DISPOSAL"
                      ? GestureDetector(
                        key: Key("disposal_button"),
                        onTap: () => _buildDisposalModal(),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFFF24D30),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Descartado",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Row(
                                  children: [
                                    Text(
                                      "Esse pneu foi descartado, veja o motivo",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.arrow_circle_right_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      : SizedBox(
                        child: Row(
                          children: [
                            Text("Status: "),
                            SizedBox(width: 5),
                            TextTireStatus(
                              status:
                                  _detailtireScreenStore
                                      .detailTireModel
                                      .status!,
                            ),
                          ],
                        ),
                      ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: TextRowInformation(
                      text: "Serial:  ",
                      value:
                          _detailtireScreenStore.detailTireModel.serialNumber!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextRowInformation(
                      text: "Empresa:  ",
                      value:
                          _detailtireScreenStore
                              .detailTireModel
                              .companyGroupName!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextRowInformation(
                      text: "Filial:  ",
                      value:
                          _detailtireScreenStore
                              .detailTireModel
                              .branchOfficeName!,
                    ),
                  ),
                  // Bloco Pneu
                  TextSection(title: "Pneu"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: TextRowInformation(
                          text: "DOT:  ",
                          value:
                              _detailtireScreenStore.detailTireModel.dot ?? "",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: TextRowInformation(
                          text: "Custo:  ",
                          value:
                              "R\$ ${_detailtireScreenStore.detailTireModel.purchaseCost}",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: TextRowInformation(
                          text: "Novo ?:  ",
                          value:
                              _detailtireScreenStore.detailTireModel.newTire!
                                  ? "Sim"
                                  : "Não",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: TextRowInformation(
                          text: "Data criação:  ",
                          value: DateFormat('dd/MM/yyyy').format(
                            DateTime.parse(
                              _detailtireScreenStore.detailTireModel.createdAt!,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextRowInformation(
                      text: "Tamanho:  ",
                      value:
                          '${_detailtireScreenStore.detailTireModel.tireSize!.width}/${_detailtireScreenStore.detailTireModel.tireSize!.height}',
                    ),
                  ),
                  _detailtireScreenStore.detailTireModel.status == "INSTALLED"
                      ? Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: TextRowInformation(
                          text: "Veículo instalado:  ",
                          value:
                              "${_detailtireScreenStore.detailTireModel.installed!.licensePlate}",
                        ),
                      )
                      : SizedBox(),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextRowInformation(
                      text: "Feito por:  ",
                      value:
                          "${_detailtireScreenStore.detailTireModel.make!.name}",
                    ),
                  ),
                  SizedBox(height: 30),
                  TextSection(title: "Ciclo de vida"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: TextRowInformation(
                          text: "Ciclo atual:  ",
                          value:
                              "${_detailtireScreenStore.detailTireModel.currentLifeCycle}",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: TextRowInformation(
                          text: "Max. Recapagens esperadas:  ",
                          value:
                              "${_detailtireScreenStore.detailTireModel.maxRetreadsExpected}",
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextRowInformation(
                      text: "Nº de Recapagens:  ",
                      value:
                          "${_detailtireScreenStore.detailTireModel.timesRetreaded}",
                    ),
                  ),
                  SizedBox(height: 30),

                  // Pressão
                  TextSection(title: "Pressão"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: TextRowInformation(
                          text: "Pressão Atual:  ",
                          value:
                              "${_detailtireScreenStore.detailTireModel.currentPressure}",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: TextRowInformation(
                          text: "Pressão Recomendada:  ",
                          value:
                              "${_detailtireScreenStore.detailTireModel.recommendedPressure}",
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // Sulcos da Banda de Rodagem
                  TextSection(title: "Sulcos da Banda de Rodagem"),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextRowInformation(
                      text: "Interno:  ",
                      value:
                          "${_detailtireScreenStore.detailTireModel.innerTreadDepth}",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextRowInformation(
                      text: "Médio Interno:  ",
                      value:
                          "${_detailtireScreenStore.detailTireModel.middleInnerTreadDepth}",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextRowInformation(
                      text: "Externo:  ",
                      value:
                          "${_detailtireScreenStore.detailTireModel.outerTreadDepth}",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextRowInformation(
                      text: "Médio Externo:  ",
                      value:
                          "${_detailtireScreenStore.detailTireModel.middleOuterTreadDepth}",
                    ),
                  ),

                  _detailtireScreenStore.detailTireModel.currentRetread != null
                      ? _buildRetreadSection(
                        _detailtireScreenStore.detailTireModel,
                      )
                      : SizedBox(height: 30),

                  _detailtireScreenStore.detailTireModel.registrationImages !=
                              null &&
                          _detailtireScreenStore
                              .detailTireModel
                              .registrationImages!
                              .isNotEmpty
                      ? _buildPhotosSection(
                        _detailtireScreenStore.detailTireModel,
                      )
                      : SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRetreadSection(GetDetailTiresModel retread) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),

        // Recapagem atual
        TextSection(title: "Recapagem atual"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextRowInformation(
                text: "Feito por:  ",
                value:
                    "${_detailtireScreenStore.detailTireModel.currentRetread!.make!.name}",
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextRowInformation(
                text: "Qtd. Ranhura:  ",
                value:
                    "${_detailtireScreenStore.detailTireModel.currentRetread!.model!.groovesQuantity}",
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextRowInformation(
            text: "Modelo:  ",
            value:
                "${_detailtireScreenStore.detailTireModel.currentRetread!.model!.name}",
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextRowInformation(
            text: "Profundidade da ranhura:  ",
            value:
                "${_detailtireScreenStore.detailTireModel.currentRetread!.model!.treadDepth}",
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextRowInformation(
            text: "Custo recapagem:  ",
            value:
                "R\$ ${_detailtireScreenStore.detailTireModel.currentRetread!.retreadCost}",
          ),
        ),
      ],
    );
  }

  Widget _buildPhotosSection(GetDetailTiresModel retread) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _detailtireScreenStore.detailTireModel.currentRetread != null
            ? SizedBox(height: 30)
            : SizedBox(),

        // Fotos
        TextSection(title: "Fotos"),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                _detailtireScreenStore
                    .detailTireModel
                    .registrationImages!
                    .length,
            itemBuilder: (context, index) {
              return GestureDetector(
                key: Key("tire_photo_$index"),
                onTap:
                    () => _buildImageModal(
                      _detailtireScreenStore
                          .detailTireModel
                          .registrationImages![index]
                          .url!,
                    ),
                child: Container(
                  width: 100,
                  height: 80,
                  margin: EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      _detailtireScreenStore
                          .detailTireModel
                          .registrationImages![index]
                          .url!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Future<void> _buildImageModal(String imageUrl) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          key: Key("modal_image"),
          child: Container(
            width: 80.w,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _buildDisposalModal() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Dialog(
            key: Key("modal_disposal"),
            child: Container(
              width: 80.w,
              constraints: BoxConstraints(minHeight: 250),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Motivo",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1B244B),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      _detailtireScreenStore
                              .detailTireModel
                              .disposal!
                              .disposalReasonDescription ??
                          "Motivo não informado",
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Fotos",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF1B244B),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Divider(thickness: 2),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            _detailtireScreenStore
                                .detailTireModel
                                .disposal!
                                .disposalImagesUrl!
                                .length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            key: Key("disposal_photo_$index"),
                            onTap:
                                () => _buildImageModal(
                                  _detailtireScreenStore
                                      .detailTireModel
                                      .disposal!
                                      .disposalImagesUrl![index],
                                ),
                            child: Container(
                              width: 100,
                              height: 80,
                              margin: EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  _detailtireScreenStore
                                      .detailTireModel
                                      .disposal!
                                      .disposalImagesUrl![index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
