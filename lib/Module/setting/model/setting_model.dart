class SettingsModel {
  String? message;
  int? code;
  bool? success;
  Data? data;

  SettingsModel({this.message, this.code, this.success, this.data});

  SettingsModel.fromJson(Map<String, dynamic> json) {
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
  String? whatsapp;
  String? instagram;
  String? twitter;
  String? snapchat;
  String? whatsappContact;

  Data(
      {this.whatsapp,
      this.instagram,
      this.twitter,
      this.snapchat,
      this.whatsappContact});

  Data.fromJson(Map<String, dynamic> json) {
    whatsapp = json['whatsapp'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    snapchat = json['snapchat'];
    whatsappContact = json['whatsapp_contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['whatsapp'] = whatsapp;
    data['instagram'] = instagram;
    data['twitter'] = twitter;
    data['snapchat'] = snapchat;
    data['whatsapp_contact'] = whatsappContact;
    return data;
  }
}
