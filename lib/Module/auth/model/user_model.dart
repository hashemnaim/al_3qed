class UserModel {
  int? id;
  String? fname;
  String? lname;
  String? fullName;
  String? mobile;
  String? email;
  String? photo;
  bool? verified;

  UserModel(
      {this.id,
      this.fname,
      this.lname,
      this.fullName,
      this.mobile,
      this.email,
      this.photo,
      this.verified});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    fullName = json['full_name'];
    mobile = json['mobile'];
    email = json['email'];
    photo = json['photo'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fname'] = fname;
    data['lname'] = lname;
    data['full_name'] = fullName;
    data['mobile'] = mobile;
    data['email'] = email;
    data['photo'] = photo;
    data['verified'] = verified;
    return data;
  }
}
