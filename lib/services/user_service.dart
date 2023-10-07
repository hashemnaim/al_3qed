import '../core/helper/dio_helper.dart';

class AuthService {
  static Future<dynamic> deleteAccont() async {
    var response = await DioHelper.postData("account/delete");
    return response;
  }
}
