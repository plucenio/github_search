import 'package:dartz/dartz.dart';
import '../entities/result_serach.dart';
import '../errors/errors.dart';

abstract class ISearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}
