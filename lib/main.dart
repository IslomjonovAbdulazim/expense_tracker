// lib/main_binding.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/bindings/initial_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

// final faker = Faker();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await GetStorage.init();
  // Get.put(ThemeController());
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: SystemUiOverlay.values);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await Get.putAsync(() => ConnectivityService().init());
    //   await Get.putAsync(() => TokenService().init());
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeController themeController = Get.find<ThemeController>();
    return GetMaterialApp(
      title: 'Expense Tracker',
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      // themeMode: themeController.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      initialBinding: InitialBinding(),
      getPages: AppPages.pages,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.noScaling,
          boldText: false,
        ),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: child ?? const Scaffold(),
        ),
      ),
    );
  }
}
