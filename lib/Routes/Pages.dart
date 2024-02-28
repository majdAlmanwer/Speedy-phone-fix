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
];
