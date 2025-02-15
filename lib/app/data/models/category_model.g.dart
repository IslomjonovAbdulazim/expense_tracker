// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      pk: (json['pk'] as num).toInt(),
      name: json['name'] as String,
      icon: json['icon'] as String,
      type: $enumDecode(_$ExpenseEnumEnumMap, json['type']),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'name': instance.name,
      'icon': instance.icon,
      'type': _$ExpenseEnumEnumMap[instance.type]!,
    };

const _$ExpenseEnumEnumMap = {
  ExpenseEnum.expense: 'expense',
  ExpenseEnum.income: 'income',
};
