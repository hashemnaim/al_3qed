class ContractPeriodsModel {
  String? message;
  int? code;
  bool? success;
  List<DataContractPeriods>? data;

  ContractPeriodsModel({this.message, this.code, this.success, this.data});

  ContractPeriodsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <DataContractPeriods>[];
      json['data'].forEach((v) {
        data!.add(DataContractPeriods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataContractPeriods {
  int? id;
  String? period;
  String? note;

  DataContractPeriods({this.id, this.period, this.note});

  DataContractPeriods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    period = json['period'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['period'] = period;
    data['note'] = note;
    return data;
  }
}
