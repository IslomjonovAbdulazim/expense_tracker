class ExpenseEntity {
  final int id;
  final String category;
  final bool isIncome;
  final int amount;
  final String description;
  final DateTime time;

  ExpenseEntity({
    required this.id,
    required this.description,
    required this.category,
    required this.time,
    required this.amount,
    required this.isIncome,
  });
}
