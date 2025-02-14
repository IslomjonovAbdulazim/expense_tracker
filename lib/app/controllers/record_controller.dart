import 'package:expense_tracker/domain/entities/expense_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isIncome = false.obs;
  TextEditingController numberController = TextEditingController();
  Rx<FocusNode> numberFocus = FocusNode().obs;
  TextEditingController descriptionController = TextEditingController();
  Rx<FocusNode> descriptionFocus = FocusNode().obs;
  Rx<String?>? selectedCategory;

  Rx<ExpenseEntity> category = fakeExpense.obs;

  @override
  void onInit() {
    loadAll();
    super.onInit();
  }

  Future<void> loadAll() async {
    isLoading.value = false;
    isIncome.value = Get.arguments;
    isLoading.value = true;
  }

  void unFocus() {
    numberFocus.value.unfocus();
    descriptionFocus.value.unfocus();
  }

  void selectCategory(String? val) {
    selectedCategory?.value = val;
  }
}
