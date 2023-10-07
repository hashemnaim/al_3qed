import 'dart:developer';
import 'dart:io';

import 'package:al_3qed/Module/create_contract/model/step_model.dart';
import 'package:al_3qed/Module/create_contract/service/create_contract_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../core/helper/image_helper.dart';

class PaymentController extends GetxController {
  RxString imageFatoora = "".obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameAccountTransfeController = TextEditingController();
  TextEditingController typeBankAccount = TextEditingController();

  Future<StepModel> setStep6() async {
    dio.MultipartFile? images;
    if (imageFatoora.value != "") {
      dio.MultipartFile? images =
          await ImageHelper.helper.compressFile(File(imageFatoora.value));
      log(images.toString());
    }
    Map<String, dynamic> data = {
      "id": 1,
      "receipt_image": images,
      "client_account_holder_name": nameAccountTransfeController.text,
    };
    log("setStep6 ================> ${data.toString()}");

    return await CreateContractService.setStep6(data);
  }
}
