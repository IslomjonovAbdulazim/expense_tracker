import 'package:expense_tracker/domain/entities/expense_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    required int id,
    required String category,
    required bool isIncome,
    required int amount,
    required String description,
    required DateTime time,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);
}

extension ExpenseModelX on ExpenseModel {
  ExpenseEntity toEntity() {
    return ExpenseEntity(
      id: id,
      category: category,
      isIncome: isIncome,
      amount: amount,
      description: description,
      time: time,
    );
  }
}

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
