class Step1Model {
  String? message;
  int? code;
  bool? success;
  DataStep1? data;

  Step1Model({this.message, this.code, this.success, this.data});

  Step1Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    success = json['success'];
    data = json['data'] != null ? DataStep1.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataStep1 {
  int? id;
  String? contractType;
  int? step;
  String? contractOwnership;
  String? instrumentType;
  String? instrumentNumber;
  String? instrumentHistory;
  bool? propertyOwnerIsDeceased;
  int? propertyTypeId;
  int? propertyUsagesId;
  int? propertyCityId;
  int? propertyRegionId;
  String? neighborhood;
  String? buildingNumber;
  String? postalCode;
  String? extraFigure;

  DataStep1(
      {this.id,
      this.contractType,
      this.step,
      this.contractOwnership,
      this.instrumentType,
      this.instrumentNumber,
      this.instrumentHistory,
      this.propertyOwnerIsDeceased,
      this.propertyTypeId,
      this.propertyUsagesId,
      this.propertyCityId,
      this.propertyRegionId,
      this.neighborhood,
      this.buildingNumber,
      this.postalCode,
      this.extraFigure});

  DataStep1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractType = json['contract_type'];
    step = json['step'];
    contractOwnership = json['contract_ownership'];
    instrumentType = json['instrument_type'];
    instrumentNumber = json['instrument_number'];
    instrumentHistory = json['instrument_history'];
    propertyOwnerIsDeceased = json['property_owner_is_deceased'];
    propertyTypeId = json['property_type_id'];
    propertyUsagesId = json['property_usages_id'];
    propertyCityId = json['property_city_id'];
    propertyRegionId = json['property_region_id'];
    neighborhood = json['neighborhood'];
    buildingNumber = json['building_number'];
    postalCode = json['postal_code'];
    extraFigure = json['extra_figure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contract_type'] = contractType;
    data['step'] = step;
    data['contract_ownership'] = contractOwnership;
    data['instrument_type'] = instrumentType;
    data['instrument_number'] = instrumentNumber;
    data['instrument_history'] = instrumentHistory;
    data['property_owner_is_deceased'] = propertyOwnerIsDeceased;
    data['property_type_id'] = propertyTypeId;
    data['property_usages_id'] = propertyUsagesId;
    data['property_city_id'] = propertyCityId;
    data['property_region_id'] = propertyRegionId;
    data['neighborhood'] = neighborhood;
    data['building_number'] = buildingNumber;
    data['postal_code'] = postalCode;
    data['extra_figure'] = extraFigure;
    return data;
  }
}
