import 'category_entity.dart';

enum ExpenseEnum {
  expense,
  income,
}

class ExpenseEntity {
  final int id;
  final ExpenseEnum type;
  final int amount;
  final String description;
  final DateTime time;
  final CategoryEntity category;

  ExpenseEntity({
    required this.id,
    required this.description,
    required this.time,
    required this.amount,
    required this.type,
    required this.category,
  });
}

final fakeExpense = ExpenseEntity(
  id: -1,
  type: ExpenseEnum.income,
  description: '',
  time: DateTime.now(),
  amount: -1,
  category: CategoryEntity(
    id: -1,
    name: "name",
    icon: "icon",
    type: ExpenseEnum.income,
  ),
);
