import 'package:github_serach/modules/search/infra/models/result_search_model.dart';

abstract class ISearchDataSource {
  Future<List<ResultSearchModel>> getSearch(String searchText);
}
