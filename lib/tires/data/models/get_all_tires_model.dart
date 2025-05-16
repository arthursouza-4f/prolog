import 'package:json_annotation/json_annotation.dart';

part 'get_all_tires_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllTiresModel {
  List<TireContent>? content;
  int? pageSize;
  int? pageNumber;
  int? numberOfElements;
  bool? empty;
  bool? lastPage;

  GetAllTiresModel({
    this.content,
    this.pageSize,
    this.pageNumber,
    this.numberOfElements,
    this.empty,
    this.lastPage,
  });

  factory GetAllTiresModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllTiresModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllTiresModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TireContent {
  int? id;
  String? serialNumber;
  String? additionalId;
  int? companyGroupId;
  String? companyGroupName;
  int? branchOfficeId;
  String? branchOfficeName;
  int? currentLifeCycle;
  int? timesRetreaded;
  int? maxRetreadsExpected;
  int? recommendedPressure;
  int? currentPressure;
  double? middleInnerTreadDepth;
  double? outerTreadDepth;
  double? middleOuterTreadDepth;
  double? innerTreadDepth;
  String? dot;
  double? purchaseCost;
  bool? newTire;
  String? status;
  String? createdAt;
  TireSize? tireSize;
  Make? make;
  Model? model;
  CurrentRetread? currentRetread;
  Installed? installed;
  Disposal? disposal;
  Analysis? analysis;
  List<RegistrationImage>? registrationImages;

  TireContent({
    this.id,
    this.serialNumber,
    this.additionalId,
    this.companyGroupId,
    this.companyGroupName,
    this.branchOfficeId,
    this.branchOfficeName,
    this.currentLifeCycle,
    this.timesRetreaded,
    this.maxRetreadsExpected,
    this.recommendedPressure,
    this.currentPressure,
    this.middleInnerTreadDepth,
    this.outerTreadDepth,
    this.middleOuterTreadDepth,
    this.innerTreadDepth,
    this.dot,
    this.purchaseCost,
    this.newTire,
    this.status,
    this.createdAt,
    this.tireSize,
    this.make,
    this.model,
    this.currentRetread,
    this.installed,
    this.disposal,
    this.analysis,
    this.registrationImages,
  });

  factory TireContent.fromJson(Map<String, dynamic> json) =>
      _$TireContentFromJson(json);

  Map<String, dynamic> toJson() => _$TireContentToJson(this);
}

@JsonSerializable()
class TireSize {
  int? id;
  int? height;
  int? width;
  double? rim;

  TireSize({this.id, this.height, this.width, this.rim});

  factory TireSize.fromJson(Map<String, dynamic> json) =>
      _$TireSizeFromJson(json);

  Map<String, dynamic> toJson() => _$TireSizeToJson(this);
}

@JsonSerializable()
class Make {
  int? id;
  String? name;

  Make({this.id, this.name});

  factory Make.fromJson(Map<String, dynamic> json) => _$MakeFromJson(json);

  Map<String, dynamic> toJson() => _$MakeToJson(this);
}

@JsonSerializable()
class Model {
  int? id;
  String? name;
  int? groovesQuantity;
  double? treadDepth;

  Model({this.id, this.name, this.groovesQuantity, this.treadDepth});

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentRetread {
  Make? make;
  RetreadModel? model;
  double? retreadCost;

  CurrentRetread({this.make, this.model, this.retreadCost});

  factory CurrentRetread.fromJson(Map<String, dynamic> json) =>
      _$CurrentRetreadFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentRetreadToJson(this);
}

@JsonSerializable()
class RetreadModel {
  int? id;
  String? name;
  String? additionalId;
  int? groovesQuantity;
  double? treadDepth;

  RetreadModel({
    this.id,
    this.name,
    this.additionalId,
    this.groovesQuantity,
    this.treadDepth,
  });

  factory RetreadModel.fromJson(Map<String, dynamic> json) =>
      _$RetreadModelFromJson(json);

  Map<String, dynamic> toJson() => _$RetreadModelToJson(this);
}

@JsonSerializable()
class Installed {
  int? vehicleId;
  String? licensePlate;
  String? fleetId;
  int? installedPosition;
  String? installedPositionName;

  Installed({
    this.vehicleId,
    this.licensePlate,
    this.fleetId,
    this.installedPosition,
    this.installedPositionName,
  });

  factory Installed.fromJson(Map<String, dynamic> json) =>
      _$InstalledFromJson(json);

  Map<String, dynamic> toJson() => _$InstalledToJson(this);
}

@JsonSerializable()
class Disposal {
  int? disposalReasonId;
  String? disposalReasonDescription;
  List<String>? disposalImagesUrl;

  Disposal({
    this.disposalReasonId,
    this.disposalReasonDescription,
    this.disposalImagesUrl,
  });

  factory Disposal.fromJson(Map<String, dynamic> json) =>
      _$DisposalFromJson(json);

  Map<String, dynamic> toJson() => _$DisposalToJson(this);
}

@JsonSerializable()
class Analysis {
  int? recapperId;
  String? recapperName;
  String? recapperPickUpId;
  String? reason;

  Analysis({
    this.recapperId,
    this.recapperName,
    this.recapperPickUpId,
    this.reason,
  });

  factory Analysis.fromJson(Map<String, dynamic> json) =>
      _$AnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisToJson(this);
}

@JsonSerializable()
class RegistrationImage {
  int? id;
  String? url;

  RegistrationImage({this.id, this.url});

  factory RegistrationImage.fromJson(Map<String, dynamic> json) =>
      _$RegistrationImageFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationImageToJson(this);
}
