import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairstylesapp/presentation/welcome/screen_welcome.dart';
import 'configuration/app_config.dart';

void main() {
  AppConfig.getFlavorConfiguration(
    isDevelopment: true,
    testing: true,
    appVersionCode: '0.0.1',
  );
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase Services (after setting up in Firebase Console)
  // _firebaseInit();
  runApp(
    DevicePreview(
      enabled: FlavorConfig.instance.variables['test'] == 'true',//!kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          locale: DevicePreview.locale(context), // Add the locale here
          builder: EasyLoading.init(builder: DevicePreview.appBuilder,),
// showPerformanceOverlay: (FlavorConfig.instance.name != AppConstants.instance.PRODUCTION) ? true : false,
          title: FlavorConfig.instance.variables['appName'],
          debugShowCheckedModeBanner: FlavorConfig.instance.variables['test'] == 'false',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          home: const WelcomeScreen(),
        );
      },
    );
  }

}

