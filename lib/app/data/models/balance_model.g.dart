// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceModelImpl _$$BalanceModelImplFromJson(Map<String, dynamic> json) =>
    _$BalanceModelImpl(
      total: (json['total'] as num).toInt(),
      incomeSum: (json['income_sum'] as num).toInt(),
      expensesSum: (json['expenses_sum'] as num).toInt(),
    );

Map<String, dynamic> _$$BalanceModelImplToJson(_$BalanceModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'income_sum': instance.incomeSum,
      'expenses_sum': instance.expensesSum,
    };
