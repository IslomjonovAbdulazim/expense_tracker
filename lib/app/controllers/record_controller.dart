import 'package:expense_tracker/domain/entities/expense_entity.dart';
import 'package:expense_tracker/domain/repositories/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/helpers/status_code_helper.dart';

class RecordController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<TextEditingController> numberController = TextEditingController().obs;
  Rx<FocusNode> numberFocus = FocusNode().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  Rx<FocusNode> descriptionFocus = FocusNode().obs;
  Rx<String?>? selectedCategory;
  Rx<ExpenseEntity> expense = fakeExpense.obs;

  Rx<ExpenseEntity> category = fakeExpense.obs;

  @override
  void onInit() {
    loadAll();
    super.onInit();
  }

  Future<void> loadAll() async {
    isLoading.value = false;
    int id = Get.arguments;
    final api = Get.find<ExpenseRepository>();
    final result = await api.specificExpense(id);
    result.fold(
      (failure) {
        StatusCodeService.showSnackbar(failure.statusCode ?? 505);
      },
      (response) {
        expense.value = response;
        rewrite();
      },
    );
    isLoading.value = true;
  }

  void rewrite() {
    numberController.value.text = expense.value.amount.toString();
    descriptionController.value.text = expense.value.description;
  }

  void unFocus() {
    numberFocus.value.unfocus();
    descriptionFocus.value.unfocus();
  }

  void selectCategory(String? val) {
    selectedCategory?.value = val;
  }
}
