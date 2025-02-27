import 'package:expense_tracker/app/bindings/home_binding.dart';
import 'package:expense_tracker/app/bindings/record_binding.dart';
import 'package:expense_tracker/pages/home_page.dart';
import 'package:expense_tracker/pages/record_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.record,
      page: () => RecordPage(),
      binding: RecordBinding(),
    ),
  ];
}
