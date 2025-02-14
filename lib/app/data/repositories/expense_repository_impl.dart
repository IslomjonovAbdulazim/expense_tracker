import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:expense_tracker/app/data/models/expense_model.dart';
import 'package:expense_tracker/app/data/providers/expense_api_client.dart';
import 'package:expense_tracker/domain/entities/expense_entity.dart';
import 'package:expense_tracker/domain/repositories/expense_repository.dart';
import 'package:expense_tracker/utils/constants/api_constants.dart';
import 'package:expense_tracker/utils/errors/network_failure.dart';

class ExpenseRepositoryImpl extends ExpenseRepository {
  final ExpenseApiClient apiClient;

  ExpenseRepositoryImpl({Dio? dio})
      : apiClient = ExpenseApiClient(
          dio ??
              Dio(
                BaseOptions(
                  baseUrl: ApiConstants.baseURL,
                  connectTimeout: Duration(seconds: 30),
                  receiveTimeout: Duration(seconds: 30),
                ),
              ),
        );

  @override
  Future<Either<NetworkFailure, List<ExpenseEntity>>> allExpenses() async {
    try {
      final expenses = await apiClient.allExpenses();
      return Right(expenses.map((expense) => expense.toEntity()).toList());
    } on DioException catch (e) {
      return Left(
        NetworkFailure(
          message: e.response?.statusMessage,
          statusCode: e.response?.statusCode,
        ),
      );
    }
  }
}
