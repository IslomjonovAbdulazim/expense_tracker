class ApiConstants {
  static const String baseURL = "http://10.10.1.85:8000";

  /// BALANCE
  static const String balance = "/api/v1/auth/balance";

  /// CATEGORY
  static const String createCategory = "/api/v1/auth/category/create";
  static const String deleteCategory = "/api/v1/auth/category/delete/";
  static const String updateCategoryPut = "/api/v1/auth/category/put/";
  static const String updateCategoryPatch = "/api/v1/auth/category/put/";

  /// EXPENSES
  static const String createExpense = "/api/v1/auth/expenses/create";
  static const String deleteExpense = "/api/v1/auth/expenses/delete/";
  static const String allExpenses = "/api/v1/expenses/list/";
  static const String singleExpense = "/api/v1/auth/expenses/list/";
  static const String updateExpensePut = "/api/v1/auth/expenses/put/";
  static const String updateExpensePatch = "/api/v1/auth/expenses/put/";

  /// AUTH
  static const String login = "/api/v1/auth/login/";
  static const String register = "/api/v1/auth/register/";
}
