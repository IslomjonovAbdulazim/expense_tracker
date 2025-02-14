import 'package:expense_tracker/domain/entities/expense_entity.dart';
import 'package:expense_tracker/domain/repositories/expense_repository.dart';
import 'package:get/get.dart';

import '../../utils/helpers/status_code_helper.dart';

List<String> incomeCategories = [
  "Salary",
  "Business",
  "Investments",
  "Freelancing",
  "Rental Income",
  "Gifts",
  "Other Income"
];

List<String> expenseCategories = [
  "Housing",
  "Food & Groceries",
  "Transportation",
  "Utilities",
  "Health",
  "Education",
  "Savings & Investments",
  "Entertainment",
  "Debt Payments",
  "Miscellaneous"
];

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<List<ExpenseEntity>> expenses = Rx<List<ExpenseEntity>>([]);
  RxInt income = 0.obs;
  RxInt expense = 0.obs;
  RxInt balance = 0.obs;

  @override
  void onInit() {
    loadAll();
    super.onInit();
  }

  Future<void> loadAll() async {
    isLoading = true.obs;
    final api = Get.find<ExpenseRepository>();
    final result = await api.allExpenses();
    result.fold(
      (failure) {
        StatusCodeService.showSnackbar(failure.statusCode ?? 505);
      },
      (response) {
        if (response.isNotEmpty) {
          expenses.value = response;
        } else {
          StatusCodeService.showSnackbar(505);
        }
      },
    );
    income = 0.obs;
    expense = 0.obs;
    for (int i = 0; i < expenses.value.length; i++) {
      if (expenses.value[i].type == ExpenseEnum.income) {
        income += expenses.value[i].amount;
      } else {
        expense += expenses.value[i].amount;
      }
    }
    balance = income - expense.value;
    isLoading = false.obs;
  }
}
