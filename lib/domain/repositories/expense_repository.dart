import 'package:dartz/dartz.dart';

import '../../utils/errors/network_failure.dart';
import '../entities/expense_entity.dart';

abstract class ExpenseRepository {
  Future<Either<NetworkFailure, List<ExpenseEntity>>> allExpenses();
}
