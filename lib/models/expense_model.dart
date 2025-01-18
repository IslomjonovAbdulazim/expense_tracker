import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ExpenseModel {
  late String category;
  late bool isIncome;
  late int amount;
  late String description;
  late DateTime time;

  ExpenseModel({
    required this.category,
    required this.isIncome,
    required this.amount,
    required this.description,
    required this.time,
  });

  ExpenseModel.fromJson(Map json) {
    category = json["category"];
    isIncome = json["isIncome"];
    amount = json["amount"];
    description = json["description"];
    time = DateTime.parse(json["time"]);
  }

  Map toJson() {
    Map json = {};
    json["category"] = category;
    json["isIncome"] = isIncome;
    json["amount"] = amount;
    json["description"] = description;
    json["time"] = time.toIso8601String();
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

Future<void> deleteExpense(ExpenseModel expense) async {
  List<ExpenseModel> expenses = await getExpenses();
  expenses.removeWhere((obj) => obj.time == expense.time);
  await saveExpenses(expenses);
}

Future<void> addNewExpense(ExpenseModel expense) async {
  List<ExpenseModel> expenses = await getExpenses();
  expenses.removeWhere((obj) => obj.time == expense.time);
  expenses.add(expense);
  await saveExpenses(expenses);
}

Future<void> saveExpenses(List<ExpenseModel> expenses) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> jsonList =
      expenses.map((note) => json.encode(note.toJson())).toList();

  await prefs.setStringList('expenses', jsonList);
}

Future<List<ExpenseModel>> getExpenses() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String>? jsonList = prefs.getStringList('expenses');

  if (jsonList != null) {
    List<ExpenseModel> expenses = jsonList
        .map((jsonStr) => ExpenseModel.fromJson(json.decode(jsonStr)))
        .toList();
    expenses.sort((a, b) => b.time.compareTo(a.time));
    return expenses;
  } else {
    return [];
  }
}

List<String> incomeCategories = [
  "Salary",
  "Business",
  "Investments",
  "Freelancing",
  "Rental Income",
  "Gifts",
  "Other Income"
];

List<String> expenseCategories = [
  "Housing",
  "Food & Groceries",
  "Transportation",
  "Utilities",
  "Health",
  "Education",
  "Savings & Investments",
  "Entertainment",
  "Debt Payments",
  "Miscellaneous"
];
