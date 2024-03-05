import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Routes/Pages.dart';
import 'Routes/Routes.dart';
import 'Translation/AppTranslation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.authtabbar,
      getPages: pages,
      title: 'Speedy Phone Fix',
      translationsKeys: AppTranslation.translationKeys,
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      theme: ThemeData(),
    );
  }
}
