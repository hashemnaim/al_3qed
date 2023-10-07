import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  SPHelper._();
  static SPHelper sHelper = SPHelper._();
  SharedPreferences? sharedPreferences;
  Future<SharedPreferences> initSharedPrefrences() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences!;
    } else {
      return sharedPreferences!;
    }
  }

  clear() {
    initSharedPrefrences();
    sharedPreferences!.clear();
  }

  bool getThemeIsLight() {
    initSharedPrefrences();
    bool? x = sharedPreferences!.getBool('isLightTheme');
    return x ?? false;
  }

  setThemeIsLight(bool value) async {
    initSharedPrefrences();
    await sharedPreferences!.setBool('isLightTheme', value);
  }

  String getToken() {
    initSharedPrefrences();
    String? x = sharedPreferences!.getString('token');
    return x ?? "";
  }

  setToken(String value) async {
    initSharedPrefrences();
    await sharedPreferences!.setString('token', value);
  }

  String getFcmToken() {
    initSharedPrefrences();
    String? x = sharedPreferences!.getString('fcmToken');
    return x ?? "";
  }

  setFcmToken(String value) async {
    initSharedPrefrences();
    await sharedPreferences!.setString('fcmToken', value);
  }

  String getLanguge() {
    initSharedPrefrences();

    String? x = sharedPreferences!.getString("Lang");
    return x ?? "ar";
  }

  Future<void> setLanguge(String lang) {
    return sharedPreferences!.setString("Lang", lang);
  }

  Future<void> saveUserData(Map<String, dynamic> userData) async {
    initSharedPrefrences();

    // Serialize the user data as a JSON string
    final userDataJson = jsonEncode(userData);

    // Save the JSON string to SharedPreferences
    sharedPreferences!.setString('user_data', userDataJson);
  }

  Future<Map<String, dynamic>> getUserData() async {
    initSharedPrefrences();

    // Retrieve the JSON string from SharedPreferences
    final userDataJson = sharedPreferences!.getString('user_data');

    if (userDataJson != null) {
      // Deserialize the JSON string to a Map
      return jsonDecode(userDataJson);
    } else {
      // If no data is found, return an empty Map or handle the case accordingly
      return {};
    }
  }
}
