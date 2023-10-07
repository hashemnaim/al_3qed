// import 'package:al_3qed/Module/create_contract/controller/create_contract_controller.dart';
// import 'package:al_3qed/Module/create_contract/view/widget/widget_upload_image.dart';
// import 'package:al_3qed/core/constants/app_string.dart';
// import 'package:al_3qed/core/constants/images_path.dart';
// import 'package:al_3qed/core/helper/image_helper.dart';
// import 'package:al_3qed/core/helper/valdtion_helper.dart';
// import 'package:al_3qed/core/utils/spaces.dart';
// import 'package:al_3qed/widgets/custom_drop_down.dart';
// import 'package:al_3qed/widgets/custom_input.dart';
// import 'package:al_3qed/widgets/custom_svg.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class OwnerDataPage3 extends StatelessWidget {
//   const OwnerDataPage3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.arguments['title'] ?? "";
//     return SingleChildScrollView(
//       padding: EdgeInsets.zero,
//       physics: const ClampingScrollPhysics(),
//       child: Container(
//         decoration:
//             BoxDecoration(color: const Color(0xffF2F2F2).withOpacity(0.5)),
//         child: GetBuilder<CreateContractController>(
//           builder: (controller) {
//             return Form(
//               key: controller.formKey2,
//               child: Padding(
//                 padding: const EdgeInsets.all(14.0),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomDropDown(
//                         hint: controller.tenantEntity,
//                         onChanged: (item) => controller.setTenantEntity(item!),
//                         itemsList: [
//                           Item(name: AppString.person, id: 0),
//                           Item(name: AppString.company, id: 1),
//                         ],
//                       ),
//                       Visibility(
//                           visible:
//                               controller.tenantEntity != AppString.tenantEntity,
//                           child: Column(children: [
//                             Visibility(
//                               visible:
//                                   controller.tenantEntity == AppString.company,
//                               child: Column(
//                                 children: [
//                                   const SpaceH10(),
//                                   CustomInput(
//                                       hint: AppString.unifiedRegistrationNo,
//                                       controller: controller
//                                           .unifiedRegistrationNoController,
//                                       textInputType: TextInputType.text,
//                                       formValidator: (value) => ValidationHelper
//                                           .validationHelper
//                                           .validateNull(value)),
//                                 ],
//                               ),
//                             ),
//                             const SpaceH10(),
//                             CustomInput(
//                                 hint: AppString.area,
//                                 controller: controller.areaPasronController,
//                                 textInputType: TextInputType.text,
//                                 icon: ImagePaths.location,
//                                 formValidator: (value) => ValidationHelper
//                                     .validationHelper
//                                     .validateNull(value)),
//                             const SpaceH10(),
//                             CustomInput(
//                                 hint: AppString.city,
//                                 controller: controller.cityPasronController,
//                                 textInputType: TextInputType.text,
//                                 icon: ImagePaths.location,
//                                 formValidator: (value) => ValidationHelper
//                                     .validationHelper
//                                     .validateNull(value)),
//                             Visibility(
//                                 visible: controller.tenantEntity ==
//                                     AppString.company,
//                                 child: Column(children: [
//                                   const SpaceH10(),
//                                   CustomDropDown(
//                                     hint: controller.delegationType,
//                                     onChanged: (item) {
//                                       controller.delegationType = item!.name!;
//                                       controller.update();
//                                     },
//                                     itemsList: [
//                                       Item(
//                                           name: AppString
//                                               .ownerRepresentativeRecord,
//                                           id: 0),
//                                       Item(
//                                           name: AppString.agentForTenant,
//                                           id: 1),
//                                     ],
//                                   ),
//                                   Visibility(
//                                     visible: controller.delegationType !=
//                                         AppString.delegationType,
//                                     child: Column(
//                                       children: [
//                                         Visibility(
//                                           visible: controller.delegationType ==
//                                               AppString.agentForTenant,
//                                           child: Column(
//                                             children: [
//                                               const SpaceH10(),
//                                               Obx(() => WidgetUploadImage(
//                                                     title:
//                                                         AppString.imageAgency,
//                                                     buttonText:
//                                                         AppString.imageAgency,
//                                                     notImage: controller
//                                                                 .imageInstrumenTenant
//                                                                 .value ==
//                                                             ""
//                                                         ? true
//                                                         : false,
//                                                     onTap: () async {
//                                                       String? file =
//                                                           await ImageHelper
//                                                                   .helper
//                                                                   .pickImage() ??
//                                                               "";
//                                                       controller
//                                                           .imageInstrumenTenant
//                                                           .value = file;
//                                                     },
//                                                   )),
//                                             ],
//                                           ),
//                                         ),
//                                         const SpaceH10(),
//                                         CustomInput(
//                                             hint: AppString.area,
//                                             controller: controller
//                                                 .areaCompanyController,
//                                             textInputType: TextInputType.text,
//                                             icon: ImagePaths.location,
//                                             formValidator: (value) =>
//                                                 ValidationHelper
//                                                     .validationHelper
//                                                     .validateNull(value)),
//                                         const SpaceH10(),
//                                         CustomInput(
//                                             hint: AppString.city,
//                                             controller: controller
//                                                 .cityCompanyController,
//                                             textInputType: TextInputType.text,
//                                             icon: ImagePaths.location,
//                                             formValidator: (value) =>
//                                                 ValidationHelper
//                                                     .validationHelper
//                                                     .validateNull(value)),
//                                       ],
//                                     ),
//                                   ),
//                                 ])),
//                           ])),
//                     ]),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget widgetUploadInstrumen(context, void Function()? onTap, bool notImage) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Text(AppString.imageAgency,
//           style: Theme.of(context)
//               .textTheme
//               .bodySmall!
//               .copyWith(color: const Color(0xffB7B7B7))),
//       const SpaceH10(),
//       GestureDetector(
//           onTap: onTap,
//           child: Container(
//               height: 48.h,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(5.r),
//                 border: Border.all(color: Colors.grey[200]!),
//               ),
//               child:
//                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 const CustomSvg(ImagePaths.galleryExport),
//                 const SpaceW16(),
//                 Text(
//                     notImage ? AppString.imageAgency : AppString.photoAattached,
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodySmall!
//                         .copyWith(color: const Color(0xffB7B7B7)))
//               ]))),
//     ]);
//   }
// }
