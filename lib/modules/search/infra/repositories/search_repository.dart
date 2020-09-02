import 'package:github_serach/modules/search/domain/errors/errors.dart';
import 'package:github_serach/modules/search/domain/entities/result_serach.dart';
import 'package:dartz/dartz.dart';
import 'package:github_serach/modules/search/domain/repositories/i_search_repository.dart';
import 'package:github_serach/modules/search/infra/datasources/i_search_datasource.dart';

class SearchRepository implements ISearchRepository {
  final ISearchDataSource datasource;

  SearchRepository(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      String searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
