
import 'expense_entity.dart';

class CategoryEntity {
  final int id;
  final String name;
  final String icon;
  final ExpenseEnum type;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.type,
  });
}
