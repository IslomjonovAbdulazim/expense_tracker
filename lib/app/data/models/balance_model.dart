import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/expense_entity.dart';

part 'balance_model.freezed.dart';
part 'balance_model.g.dart';

@freezed
class BalanceModel with _$BalanceModel {
  const factory BalanceModel({
    required int total,
    @JsonKey(name: "income_sum")
    required int incomeSum,
    @JsonKey(name: "expenses_sum")
    required int expensesSum,
  }) = _BalanceModel;

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);
}