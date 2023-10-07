class CommonQuestionsModel {
  String? message;
  int? code;
  bool? success;
  List<Data>? data;

  CommonQuestionsModel({this.message, this.code, this.success, this.data});

  CommonQuestionsModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? answer;

  Data({this.title, this.answer});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['answer'] = answer;
    return data;
  }
}
