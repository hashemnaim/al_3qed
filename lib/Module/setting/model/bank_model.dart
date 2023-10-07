class BankModel {
  String? message;
  int? code;
  bool? success;
  List<Data>? data;

  BankModel({this.message, this.code, this.success, this.data});

  BankModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? bankName;
  String? bankAccountName;
  String? bankAccountNumber;
  String? ibanNumber;

  Data(
      {this.bankName,
      this.bankAccountName,
      this.bankAccountNumber,
      this.ibanNumber});

  Data.fromJson(Map<String, dynamic> json) {
    bankName = json['bank_name'];
    bankAccountName = json['bank_account_name'];
    bankAccountNumber = json['bank_account_number'];
    ibanNumber = json['iban_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bank_name'] = bankName;
    data['bank_account_name'] = bankAccountName;
    data['bank_account_number'] = bankAccountNumber;
    data['iban_number'] = ibanNumber;
    return data;
  }
}
