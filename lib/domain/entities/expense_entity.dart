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
