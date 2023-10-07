import 'package:al_3qed/Module/create_contract/controller/create_contract_controller.dart';
import 'package:al_3qed/Module/create_contract/view/page1/contract_data_page1.dart';
import 'package:al_3qed/Module/create_contract/view/widget/widget_appBar_contract.dart';
import 'package:al_3qed/Module/create_contract/view/widget/widget_header_create_contract.dart';
import 'package:al_3qed/Module/create_contract/view/page2/owner_date_page2.dart';
import 'package:al_3qed/Module/create_contract/view/page4/rented_unit_page4.dart';
import 'package:al_3qed/Module/create_contract/view/page5/financial_statements_page5.dart';
import 'package:al_3qed/Module/create_contract/view/widget/widget_next_previous.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/utils/spaces.dart';

class MainCreateContractScreen extends StatefulWidget {
  const MainCreateContractScreen({super.key});

  @override
  State<MainCreateContractScreen> createState() => _CreateContractScreenState();
}

class _CreateContractScreenState extends State<MainCreateContractScreen> {
  final List<Widget> _samplePages = [
    const InstrumenDataPage1(),
    const OnwerDataPage2(),
    // const OwnerDataPage3(),
    const RentedUnitDataPage4(),
    const FinancialStatementsPage5()
  ];

  List<String> titleList = [
    AppString.instrumenData,
    AppString.ownerData,
    AppString.rentedUnitData,
    AppString.financialStatements
  ];
  String title = Get.arguments['title'] ?? "";

  @override
  Widget build(BuildContext context) {
    CreateContractController createContractController =
        Get.put(CreateContractController());

    double isbottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(Get.width, 50.h),
          child: WidgetAppBarContract(
              createContractController: createContractController)),
      body: GetBuilder<CreateContractController>(
          id: "changePage",
          builder: (controller) {
            return Column(
              children: <Widget>[
                WidgetHeaderCreateContract(
                  titleList: titleList,
                  controller: controller,
                ),
                const SpaceH16(),
                Expanded(
                  child: PageView.builder(
                    controller: controller.controller,
                    itemCount: _samplePages.length,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffF2F2F2).withOpacity(0.5)),
                          child: _samplePages[index]);
                    },
                  ),
                ),
                isbottom > 0
                    ? Container()
                    : WidgetNextAndPrevious(
                        titleList: titleList, controller: controller),
              ],
            );
          }),
    );
  }
}
