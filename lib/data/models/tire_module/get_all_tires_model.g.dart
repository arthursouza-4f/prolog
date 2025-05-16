// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_tires_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTiresModel _$GetAllTiresModelFromJson(Map<String, dynamic> json) =>
    GetAllTiresModel(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => TireContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
      empty: json['empty'] as bool?,
      lastPage: json['lastPage'] as bool?,
    );

Map<String, dynamic> _$GetAllTiresModelToJson(GetAllTiresModel instance) =>
    <String, dynamic>{
      'content': instance.content?.map((e) => e.toJson()).toList(),
      'pageSize': instance.pageSize,
      'pageNumber': instance.pageNumber,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
      'lastPage': instance.lastPage,
    };

TireContent _$TireContentFromJson(Map<String, dynamic> json) => TireContent(
      id: (json['id'] as num?)?.toInt(),
      serialNumber: json['serialNumber'] as String?,
      additionalId: json['additionalId'] as String?,
      companyGroupId: (json['companyGroupId'] as num?)?.toInt(),
      companyGroupName: json['companyGroupName'] as String?,
      branchOfficeId: (json['branchOfficeId'] as num?)?.toInt(),
      branchOfficeName: json['branchOfficeName'] as String?,
      currentLifeCycle: (json['currentLifeCycle'] as num?)?.toInt(),
      timesRetreaded: (json['timesRetreaded'] as num?)?.toInt(),
      maxRetreadsExpected: (json['maxRetreadsExpected'] as num?)?.toInt(),
      recommendedPressure: (json['recommendedPressure'] as num?)?.toInt(),
      currentPressure: (json['currentPressure'] as num?)?.toInt(),
      middleInnerTreadDepth:
          (json['middleInnerTreadDepth'] as num?)?.toDouble(),
      outerTreadDepth: (json['outerTreadDepth'] as num?)?.toDouble(),
      middleOuterTreadDepth:
          (json['middleOuterTreadDepth'] as num?)?.toDouble(),
      innerTreadDepth: (json['innerTreadDepth'] as num?)?.toDouble(),
      dot: json['dot'] as String?,
      purchaseCost: (json['purchaseCost'] as num?)?.toDouble(),
      newTire: json['newTire'] as bool?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      tireSize: json['tireSize'] == null
          ? null
          : TireSize.fromJson(json['tireSize'] as Map<String, dynamic>),
      make: json['make'] == null
          ? null
          : Make.fromJson(json['make'] as Map<String, dynamic>),
      model: json['model'] == null
          ? null
          : Model.fromJson(json['model'] as Map<String, dynamic>),
      currentRetread: json['currentRetread'] == null
          ? null
          : CurrentRetread.fromJson(
              json['currentRetread'] as Map<String, dynamic>),
      installed: json['installed'] == null
          ? null
          : Installed.fromJson(json['installed'] as Map<String, dynamic>),
      disposal: json['disposal'] == null
          ? null
          : Disposal.fromJson(json['disposal'] as Map<String, dynamic>),
      analysis: json['analysis'] == null
          ? null
          : Analysis.fromJson(json['analysis'] as Map<String, dynamic>),
      registrationImages: (json['registrationImages'] as List<dynamic>?)
          ?.map((e) => RegistrationImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TireContentToJson(TireContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serialNumber': instance.serialNumber,
      'additionalId': instance.additionalId,
      'companyGroupId': instance.companyGroupId,
      'companyGroupName': instance.companyGroupName,
      'branchOfficeId': instance.branchOfficeId,
      'branchOfficeName': instance.branchOfficeName,
      'currentLifeCycle': instance.currentLifeCycle,
      'timesRetreaded': instance.timesRetreaded,
      'maxRetreadsExpected': instance.maxRetreadsExpected,
      'recommendedPressure': instance.recommendedPressure,
      'currentPressure': instance.currentPressure,
      'middleInnerTreadDepth': instance.middleInnerTreadDepth,
      'outerTreadDepth': instance.outerTreadDepth,
      'middleOuterTreadDepth': instance.middleOuterTreadDepth,
      'innerTreadDepth': instance.innerTreadDepth,
      'dot': instance.dot,
      'purchaseCost': instance.purchaseCost,
      'newTire': instance.newTire,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'tireSize': instance.tireSize?.toJson(),
      'make': instance.make?.toJson(),
      'model': instance.model?.toJson(),
      'currentRetread': instance.currentRetread?.toJson(),
      'installed': instance.installed?.toJson(),
      'disposal': instance.disposal?.toJson(),
      'analysis': instance.analysis?.toJson(),
      'registrationImages':
          instance.registrationImages?.map((e) => e.toJson()).toList(),
    };

TireSize _$TireSizeFromJson(Map<String, dynamic> json) => TireSize(
      id: (json['id'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      rim: (json['rim'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TireSizeToJson(TireSize instance) => <String, dynamic>{
      'id': instance.id,
      'height': instance.height,
      'width': instance.width,
      'rim': instance.rim,
    };

Make _$MakeFromJson(Map<String, dynamic> json) => Make(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MakeToJson(Make instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      groovesQuantity: (json['groovesQuantity'] as num?)?.toInt(),
      treadDepth: (json['treadDepth'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'groovesQuantity': instance.groovesQuantity,
      'treadDepth': instance.treadDepth,
    };

CurrentRetread _$CurrentRetreadFromJson(Map<String, dynamic> json) =>
    CurrentRetread(
      make: json['make'] == null
          ? null
          : Make.fromJson(json['make'] as Map<String, dynamic>),
      model: json['model'] == null
          ? null
          : RetreadModel.fromJson(json['model'] as Map<String, dynamic>),
      retreadCost: (json['retreadCost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrentRetreadToJson(CurrentRetread instance) =>
    <String, dynamic>{
      'make': instance.make?.toJson(),
      'model': instance.model?.toJson(),
      'retreadCost': instance.retreadCost,
    };

RetreadModel _$RetreadModelFromJson(Map<String, dynamic> json) => RetreadModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      additionalId: json['additionalId'] as String?,
      groovesQuantity: (json['groovesQuantity'] as num?)?.toInt(),
      treadDepth: (json['treadDepth'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RetreadModelToJson(RetreadModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'additionalId': instance.additionalId,
      'groovesQuantity': instance.groovesQuantity,
      'treadDepth': instance.treadDepth,
    };

Installed _$InstalledFromJson(Map<String, dynamic> json) => Installed(
      vehicleId: (json['vehicleId'] as num?)?.toInt(),
      licensePlate: json['licensePlate'] as String?,
      fleetId: json['fleetId'] as String?,
      installedPosition: (json['installedPosition'] as num?)?.toInt(),
      installedPositionName: json['installedPositionName'] as String?,
    );

Map<String, dynamic> _$InstalledToJson(Installed instance) => <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'licensePlate': instance.licensePlate,
      'fleetId': instance.fleetId,
      'installedPosition': instance.installedPosition,
      'installedPositionName': instance.installedPositionName,
    };

Disposal _$DisposalFromJson(Map<String, dynamic> json) => Disposal(
      disposalReasonId: (json['disposalReasonId'] as num?)?.toInt(),
      disposalReasonDescription: json['disposalReasonDescription'] as String?,
      disposalImagesUrl: (json['disposalImagesUrl'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DisposalToJson(Disposal instance) => <String, dynamic>{
      'disposalReasonId': instance.disposalReasonId,
      'disposalReasonDescription': instance.disposalReasonDescription,
      'disposalImagesUrl': instance.disposalImagesUrl,
    };

Analysis _$AnalysisFromJson(Map<String, dynamic> json) => Analysis(
      recapperId: (json['recapperId'] as num?)?.toInt(),
      recapperName: json['recapperName'] as String?,
      recapperPickUpId: json['recapperPickUpId'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$AnalysisToJson(Analysis instance) => <String, dynamic>{
      'recapperId': instance.recapperId,
      'recapperName': instance.recapperName,
      'recapperPickUpId': instance.recapperPickUpId,
      'reason': instance.reason,
    };

RegistrationImage _$RegistrationImageFromJson(Map<String, dynamic> json) =>
    RegistrationImage(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$RegistrationImageToJson(RegistrationImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
