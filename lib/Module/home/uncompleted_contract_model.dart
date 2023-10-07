class UncompletedContractModel {
  String? message;
  int? code;
  bool? success;
  Data? data;

  UncompletedContractModel({this.message, this.code, this.success, this.data});

  UncompletedContractModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  int? id;
  String? contractType;
  int? step;
  String? contractOwnership;
  String? instrumentType;
  bool? propertyOwnerIsDeceased;
  String? propertyTypeId;
  String? propertyUsagesId;
  String? propertyCityId;
  String? propertyRegionId;
  String? neighborhood;
  String? buildingNumber;
  String? postalCode;
  String? extraFigure;

  Data(
      {this.id,
      this.contractType,
      this.step,
      this.contractOwnership,
      this.instrumentType,
      this.propertyOwnerIsDeceased,
      this.propertyTypeId,
      this.propertyUsagesId,
      this.propertyCityId,
      this.propertyRegionId,
      this.neighborhood,
      this.buildingNumber,
      this.postalCode,
      this.extraFigure});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractType = json['contract_type'];
    step = json['step'];
    contractOwnership = json['contract_ownership'];
    instrumentType = json['instrument_type'];
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
