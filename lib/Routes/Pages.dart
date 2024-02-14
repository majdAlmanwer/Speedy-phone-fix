// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:speedy_phone_fix/Routes/Routes.dart';
import 'package:speedy_phone_fix/Screen/Auth/SignIn/SignInScreen.dart';

final pages = <GetPage>[
  GetPage(
    name: AppRoutes.signinscreen,
    page: () => const SignInScreen(),
  ),
];
