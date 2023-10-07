import 'package:al_3qed/Module/auth/complete_register/complete_register_screen.dart';
import 'package:al_3qed/Module/auth/forgetPassword/forget_password_screen.dart';
import 'package:al_3qed/Module/auth/login/login_screen.dart';
import 'package:al_3qed/Module/auth/otp/otp_screen.dart';
import 'package:al_3qed/Module/auth/register/register_screen.dart';
import 'package:al_3qed/Module/my_contract/view/screen/my_contract_screen.dart';
import 'package:al_3qed/Module/notification/notification_screen.dart';
import 'package:al_3qed/Module/payment_contract/view/screen/payment_contract_screen.dart';
import 'package:al_3qed/Module/create_contract/view/main_contract_screen.dart';
import 'package:al_3qed/Module/home/view/screen/home_screen.dart';
import 'package:al_3qed/Module/info_contract/view/screen/info_contract_screen.dart';
import 'package:al_3qed/Module/reviwe/reviwe_screen.dart';
import 'package:al_3qed/Module/setting/controller/setting_binding.dart';
import 'package:al_3qed/Module/setting/view/screen/edit_profile_screen.dart';
import 'package:al_3qed/Module/setting/view/screen/setting_screen.dart.dart';
import 'package:al_3qed/core/helper/animate_do.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initial = '/login';
  static const loginScreen = '/login';
  static const rgisterScreen = '/register';
  static const forgetPasswordScreen = '/ForgetPasswordScreen';
  static const completeRegisterScreen = '/completeRegisterScreen';
  static const otpScreen = '/otp';
  static const homeScreen = '/home';
  static const settingScreen = '/SettingScreen';
  static const mainCreateContractScreen = '/mainCreateContractScreen';
  static const infoContractScreen = '/infoContractScreen';
  static const profileScreen = '/profileScreen';
  static const paymentContractScreen = '/paymentContractScreen';
  static const myContractScreen = '/myContractScreen';
  static const notificationScreen = '/notificationScreen';
  static const reviewScreen = '/reviewScreen';
}

class Routes {
  static final routes = [
    //Auth
    GetPage(name: AppRoutes.loginScreen, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.rgisterScreen, page: () => const RegisterScreen()),
    GetPage(
        name: AppRoutes.forgetPasswordScreen,
        page: () => const ForgetPasswordScreen()),
    GetPage(
        name: AppRoutes.completeRegisterScreen,
        page: () => const CompleteRegisterScreen()),
    GetPage(name: AppRoutes.otpScreen, page: () => const OtpScreen()),
    GetPage(
        name: AppRoutes.homeScreen,
        page: () => const HomeScreen(),
        binding: SettingControllerBinding()),
    GetPage(
        name: AppRoutes.profileScreen, page: () => const EditProfileScreen()),
    GetPage(
        name: AppRoutes.mainCreateContractScreen,
        page: () => const MainCreateContractScreen()),

    GetPage(
        name: AppRoutes.infoContractScreen, page: () => InfoContractScreen()),
    GetPage(
        name: AppRoutes.settingScreen,
        page: () => FadeInLeft(
              duration: const Duration(seconds: 0),
              child: const SettingScreen(),
            )),

    GetPage(
        name: AppRoutes.paymentContractScreen,
        page: () => PaymentContractScreen()),

    GetPage(
        name: AppRoutes.myContractScreen, page: () => const MyContractScreen()),
    GetPage(
        name: AppRoutes.notificationScreen,
        page: () => const NotificationScreen()),

    GetPage(name: AppRoutes.reviewScreen, page: () => const ReviewScreen()),
  ];
}
