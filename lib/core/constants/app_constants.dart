import 'package:flutter/material.dart';

const String appName = "Faza";
const String baseUrl = "https://contract.pal4tech.com/api/";
const String API_KEY =
    "AWRsdgdyr5tDFHDF435345werfTer3dfgerSDFWFSD546&^&%@SDFsfd6545d";

const String initialCountry = 'SA';
const String initialCountryDialCode = '+966';

const kBorderRadius = 8.0;
const kSpacing = 20.0;
const kPadding = 16.0;
const k8Padding = 8.0;

double kBottomPadding(BuildContext context) {
  return MediaQuery.of(context).padding.bottom;
}

double kTopPadding(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

double kRightPadding(BuildContext context) {
  return MediaQuery.of(context).padding.right;
}

double kLeftPadding(BuildContext context) {
  return MediaQuery.of(context).padding.left;
}

class AppApi {
  static String get loginUrl => "auth/login";
  static String get signupUrl => "auth/signup";
  static String get logoutUrl => "auth/logout";
  static String get verificationUrl => "auth/verification";
  static String get profileUrl => "profile";

  ////////////////
  static String get citiesUrl => "cities";
  static String get regionsUrl => "regions";
  static String get termsUrl => "terms-and-conditions";
  static String get privacyUrl => "privacy";
  static String get commonQuestionsUrl => "common-questions";
  static String get bankAccountsUrl => "bank-accounts";
  static String get servicesPricingUrl => "services-pricing";
  static String get paperworUrl => "paperwor";
  static String get realEstatTypeUrl => "real-estat-type";
  static String get realEstatUsageUrl => "real-estat-usage";
  static String get unitsTypesUrl => "units-types";
  static String get paymentsTypesUrl => "payments-types";
  static String get contractPeriodsUrl => "contract-periods";
  static String get settingsUrl => "settings";

  /////////////////////
  static String get contractStartUrl => "contract/start";
  static String get uncompletedContractUrl => "uncompleted-contract";
  static String get step1Url => "contract/step1";
  static String get step2Url => "contract/step2";
  static String get step3Url => "contract/step3";
  static String get step4Url => "contract/step4";
  static String get step5Url => "contract/step5";
  static String get step6Url => "contract/step6";
  static String get step7Url => "contract/step7";
  static String get contracts => "contracts";
}
