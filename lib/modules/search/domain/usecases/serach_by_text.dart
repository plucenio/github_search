import 'package:dartz/dartz.dart';
import 'package:github_serach/modules/search/domain/repositories/i_search_repository.dart';
import '../entities/result_serach.dart';
import '../errors/errors.dart';

abstract class ISearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchByText implements ISearchByText {
  final ISearchRepository repository;

  SearchByText(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null) {
      return Left(NullTextError());
    }
    if (searchText == "") {
      return Left(EmptyTextError());
    }
    return repository.search(searchText);
  }
}
