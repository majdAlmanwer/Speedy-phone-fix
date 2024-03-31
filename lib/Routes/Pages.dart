// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:speedy_phone_fix/Routes/Routes.dart';
import 'package:speedy_phone_fix/Screen/Auth/AuthTabBarScreen.dart';
import 'package:speedy_phone_fix/Screen/Auth/SignIn/SignInScreen.dart';
import 'package:speedy_phone_fix/Screen/CompanyCustomer/CompanyCustomerScreen.dart';
import 'package:speedy_phone_fix/Screen/Home/HomeScreen.dart';
import 'package:speedy_phone_fix/Screen/IndividualCustomer/IndividualCustomerScreen.dart';
import 'package:speedy_phone_fix/Screen/NewCase/NewCaseScreen.dart';
import 'package:speedy_phone_fix/Screen/Order/OrderScreen.dart';
import 'package:speedy_phone_fix/Screen/Profile/ProfileScreen.dart';
import 'package:speedy_phone_fix/Screen/Setting/CaseStatus/CaseStatusScreen.dart';
import 'package:speedy_phone_fix/Screen/Setting/CaseType/CaseTypeScreen.dart';
import 'package:speedy_phone_fix/Screen/Setting/DeviceData/DeviceDataScreen.dart';
import 'package:speedy_phone_fix/Screen/Setting/MakeModel/MakeModelScreen.dart';
import 'package:speedy_phone_fix/Screen/Setting/SettingScreen.dart';
import 'package:speedy_phone_fix/Screen/Setting/Unit/UnitScreen.dart';
import 'package:speedy_phone_fix/Screen/SplashScreen.dart';

final pages = <GetPage>[
  GetPage(
    name: AppRoutes.signinscreen,
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: AppRoutes.homescreen,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.newcasescreen,
    page: () => const NewCaseScreen(),
  ),
  GetPage(
    name: AppRoutes.companyCustomerScreen,
    page: () => const CompanyCustomerScreen(),
  ),
  GetPage(
    name: AppRoutes.individualCustomerScreen,
    page: () => const IndividualCustomerScreen(),
  ),
  GetPage(
    name: AppRoutes.orderScreen,
    page: () => const OrderScreen(),
  ),
  GetPage(
    name: AppRoutes.authtabbar,
    page: () => const AuthTabBar(),
  ),
  GetPage(
    name: AppRoutes.settingscreen,
    page: () => const SettingScreen(),
  ),
  GetPage(
    name: AppRoutes.profilescreen,
    page: () => const ProfileScreen(),
  ),
  GetPage(
    name: AppRoutes.casestatusscreen,
    page: () => const CaseStatusScreen(),
  ),
  GetPage(
    name: AppRoutes.casetypescreen,
    page: () => const CaseTypeScreen(),
  ),
  GetPage(
    name: AppRoutes.devicedatascreen,
    page: () => const DeviceDataScreen(),
  ),
  GetPage(
    name: AppRoutes.makemodelscreen,
    page: () => const MakeModelScreen(),
  ),
  GetPage(
    name: AppRoutes.unitscreen,
    page: () => const UnitScreen(),
  ),
  GetPage(
    name: AppRoutes.splash,
    page: () => const SplashScreen(),
  ),
];
