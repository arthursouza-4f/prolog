import 'package:json_annotation/json_annotation.dart';

part 'get_detail_tires_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetDetailTiresModel {
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
  int? purchaseCost;
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

  GetDetailTiresModel();

  factory GetDetailTiresModel.fromJson(Map<String, dynamic> json) =>
      _$GetDetailTiresModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailTiresModelToJson(this);
}

@JsonSerializable()
class TireSize {
  int? id;
  int? height;
  int? width;
  double? rim;

  TireSize();

  factory TireSize.fromJson(Map<String, dynamic> json) =>
      _$TireSizeFromJson(json);

  Map<String, dynamic> toJson() => _$TireSizeToJson(this);
}

@JsonSerializable()
class Make {
  int? id;
  String? name;

  Make();

  factory Make.fromJson(Map<String, dynamic> json) => _$MakeFromJson(json);

  Map<String, dynamic> toJson() => _$MakeToJson(this);
}

@JsonSerializable()
class Model {
  int? id;
  String? name;
  int? groovesQuantity;
  int? treadDepth;
  String? additionalId;

  Model();

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentRetread {
  Make? make;
  Model? model;
  int? retreadCost;

  CurrentRetread();

  factory CurrentRetread.fromJson(Map<String, dynamic> json) =>
      _$CurrentRetreadFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentRetreadToJson(this);
}

@JsonSerializable()
class Installed {
  int? vehicleId;
  String? licensePlate;
  String? fleetId;
  int? installedPosition;
  String? installedPositionName;

  Installed();

  factory Installed.fromJson(Map<String, dynamic> json) =>
      _$InstalledFromJson(json);

  Map<String, dynamic> toJson() => _$InstalledToJson(this);
}

@JsonSerializable()
class Disposal {
  int? disposalReasonId;
  String? disposalReasonDescription;
  List<String>? disposalImagesUrl;

  Disposal();

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

  Analysis();

  factory Analysis.fromJson(Map<String, dynamic> json) =>
      _$AnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisToJson(this);
}

@JsonSerializable()
class RegistrationImage {
  int? id;
  String? url;

  RegistrationImage();

  factory RegistrationImage.fromJson(Map<String, dynamic> json) =>
      _$RegistrationImageFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationImageToJson(this);
}
