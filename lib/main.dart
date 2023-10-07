import 'dart:ui';
import 'package:al_3qed/config/shared_preferences.dart';
import 'package:al_3qed/config/theme/my_theme.dart';
import 'package:al_3qed/core/constants/app_constants.dart';
import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'config/translations/translation.dart';
import 'core/helper/dio_helper.dart';
// import 'core/helper/fcm_helper.dart';

RxBool isLoggedIn = false.obs;
RxBool isIntroSeen = false.obs;
RxBool city = false.obs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SPHelper.sHelper.initSharedPrefrences();

  await DioHelper.init();

  if (SPHelper.sHelper.getToken() != "") {
    isLoggedIn.value = true;
  }

  runApp(const Material(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String defaultLocaleCode = Get.deviceLocale!.languageCode;

  @override
  void initState() {
    super.initState();
    // defaultLocaleCode =
    //     StorageService.getcurrentLanguage() ?? defaultLocaleCode;
    // StorageService.writeLanguage(defaultLocaleCode);
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, widget) => GetMaterialApp(
            translationsKeys: AppTranslation.translations,
            locale: const Locale("ar"),

            // fallbackLocale: const Locale('ar'),
            // supportedLocales: const [
            //   Locale('ar', ''), // English, no country code
            // ],
            localizationsDelegates: const [
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate
            ],
            builder: EasyLoading.init(),
            title: appName,
            initialRoute: isLoggedIn.value == true
                ? AppRoutes.homeScreen
                : AppRoutes.initial,
            getPages: Routes.routes,
            theme: MyTheme.getThemeData(isLight: true),
            scrollBehavior: CustomScrollBehavior(),
            debugShowCheckedModeBanner: false),
      ),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
      };
}
