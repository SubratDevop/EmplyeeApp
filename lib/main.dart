import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/bindings/bindings.dart';
import 'core/resources/strings.dart';
import 'core/widgets/app_status_bar.dart';
import 'screens/home_screen/home_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    // MyApp(),

    //^  with device Preview

    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
//^ Set status bar color
    AppStatusBar.splashStatusBarColor();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            dividerColor: Colors.transparent,
          ),
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          initialBinding: ControllerBinding(),
          initialRoute: '/',
          // getPages: getPages,
          home: const HomeScreen(),
        );
      },
    );
  }
}
