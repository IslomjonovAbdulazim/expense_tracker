import 'package:get/get.dart';

import '../../domain/repositories/expense_repository.dart';
import '../data/providers/dio_manager.dart';
import '../data/providers/expense_api_client.dart';
import '../data/repositories/expense_repository_impl.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    configureDio();
    Get.put<ExpenseApiClient>(ExpenseApiClient(dioInstance), permanent: true);
    Get.put<ExpenseRepository>(ExpenseRepositoryImpl(dio: dioInstance));
  }
}
