// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:speedy_phone_fix/Routes/Routes.dart';
import 'package:speedy_phone_fix/Screen/Auth/SignIn/SignInScreen.dart';
import 'package:speedy_phone_fix/Screen/Home/HomeScreen.dart';
import 'package:speedy_phone_fix/Screen/NewCase/NewCaseScreen.dart';

final pages = <GetPage>[
  GetPage(
    name: AppRoutes.signinscreen,
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: AppRoutes.homescreen,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.newcasescreen,
    page: () => const NewCaseScreen(),
  ),
];
