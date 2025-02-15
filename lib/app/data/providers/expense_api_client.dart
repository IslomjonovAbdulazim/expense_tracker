import 'package:dio/dio.dart';
import 'package:expense_tracker/app/data/models/expense_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../utils/constants/api_constants.dart';

part 'expense_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseURL)
abstract class ExpenseApiClient {
  factory ExpenseApiClient(Dio dio, {String baseUrl}) = _ExpenseApiClient;

  @GET(ApiConstants.allExpenses)
  Future<List<ExpenseModel>> allExpenses(
    @Header("Authorization") String token,
  );

  @GET(ApiConstants.specificExpense)
  Future<ExpenseModel> specificExpense(
    @Header("Authorization") String token,
    @Path("id") int id,
  );
}
