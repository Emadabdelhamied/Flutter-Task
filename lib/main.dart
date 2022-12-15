import 'dart:io';
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as trans;
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';

import 'features/home/presentation/pages/home_main.dart';

void main() async {
  await GetStorage.init();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Phoenix(
      child: EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: "assets/translate",
        saveLocale: true,
        startLocale: const Locale('ar'),
        useOnlyLangCode: true,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return OverlaySupport(
      child: GetMaterialApp(
        defaultTransition: trans.Transition.circularReveal,
        title: "Test",
        debugShowCheckedModeBanner: false,
        textDirection: context.locale.languageCode == "ar"
            ? ui.TextDirection.ltr
            : ui.TextDirection.rtl,
        debugShowMaterialGrid: false,
        fallbackLocale: context.fallbackLocale,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        home: Builder(builder: (context) {
          ScreenUtil.init(context, designSize: const Size(428, 926));
          return const HomeMain();
          //RatingAlert
        }),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
