import 'package:al_3qed/Module/auth/model/user_model.dart';

class SignupModel {
  String? message;
  int? code;
  bool? success;
  UserModel? user;

  SignupModel({this.message, this.code, this.success, this.user});

  SignupModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    success = json['success'];
    user = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['success'] = success;
    if (user != null) {
      data['data'] = user!.toJson();
    }
    return data;
  }
}
