// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseModelImpl _$$ExpenseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseModelImpl(
      pk: (json['pk'] as num).toInt(),
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      type: $enumDecode(_$ExpenseEnumEnumMap, json['type']),
      amount: (json['amount'] as num).toInt(),
      description: json['description'] as String,
      time: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ExpenseModelImplToJson(_$ExpenseModelImpl instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'category': instance.category,
      'type': _$ExpenseEnumEnumMap[instance.type]!,
      'amount': instance.amount,
      'description': instance.description,
      'created_at': instance.time.toIso8601String(),
    };

const _$ExpenseEnumEnumMap = {
  ExpenseEnum.expense: 'expense',
  ExpenseEnum.income: 'income',
};
