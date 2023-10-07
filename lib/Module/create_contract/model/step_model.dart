class StepModel {
  String? message;
  int? code;
  bool? success;

  StepModel({this.message, this.code, this.success});

  StepModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['success'] = success;
    return data;
  }
}
