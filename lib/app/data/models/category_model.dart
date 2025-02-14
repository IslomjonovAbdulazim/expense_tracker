import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/expense_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int pk,
    required String name,
    required String icon,
    required ExpenseEnum type,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

extension CategoryModelX on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: pk,
      name: name,
      icon: icon,
      type: type,
    );
  }
}
