import 'package:expense_tracker/domain/entities/expense_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_model.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    required int pk,
    required CategoryModel category,
    required ExpenseEnum type,
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
      id: -1,
      category: category.toEntity(),
      type: type,
      amount: amount,
      description: description,
      time: time,
    );
  }
}
