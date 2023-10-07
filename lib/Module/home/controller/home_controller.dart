import 'package:al_3qed/Module/create_contract/service/create_contract_service.dart';
import 'package:al_3qed/Module/home/view/screen/home_screen.dart';
import 'package:al_3qed/Module/my_contract/view/screen/my_contract_screen.dart';
import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/core/utils/toast.dart';
import 'package:al_3qed/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt isSelect = 0.obs;
  Rx<ContractType> contractType = ContractType.housing.obs;
  setContractStart(title) async {
    bool isContractStart = await CreateContractService.contractStart(
        {"contract_type": contractType.value.toString()});
    if (isContractStart == true) {
      await Get.toNamed(AppRoutes.mainCreateContractScreen,
          arguments: {"title": title});
    } else {
      Get.defaultDialog(
        title: title,
        middleText:
            "يوجد عقد غير مكتمل، يجب إكمال العقد الموجود لتتمكن من إنشاء عقد جديد",
        cancel: CustomPrimaryButton(
          text: "انتقال للعقد",
          onPressed: () {
            Get.off(() => const MyContractScreen());
          },
          width: 120.w,
        ),
        confirm: CustomPrimaryButton(
          text: "لا",
          onPressed: () {
            Get.back();
          },
          width: 100,
        ),
      );
      // showToast(
      //     "للاسف",
      //     "يوجد عقد غير مكتمل، يجب إكمال العقد الموجود لتتمكن من إنشاء عقد جديد",
      //     ToastType.WARNING);
    }
  }

  setCompletContractStart(
      String contractType, String title, int id, int step) async {
    bool isContractStart = await CreateContractService.contractStart(
      {"contract_type": contractType, "id": id},
    );
    if (isContractStart == true) {
      await Get.toNamed(AppRoutes.mainCreateContractScreen,
          arguments: {"title": title, "id": id, "step": 1});
    } else {
      showToast(
          title,
          "يوجد عقد غير مكتمل، يجب إكمال العقد الموجود لتتمكن من إنشاء عقد جديد",
          ToastType.WARNING);
    }
  }

  // getUncompletedContract(title) async {
  //   bool isContractStart = await CreateContractService.contractStart(
  //       {"contract_type": contractType.value.toString()});
  //   if (isContractStart == true) {
  //     await Get.toNamed(AppRoutes.mainCreateContractScreen,
  //         arguments: {"title": title});
  //   } else {
  //     showToast(
  //         title,
  //         "يوجد عقد غير مكتمل، يجب إكمال العقد الموجود لتتمكن من إنشاء عقد جديد",
  //         ToastType.WARNING);
  //   }
  // }
}
