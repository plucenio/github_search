import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_serach/modules/search/domain/entities/result_serach.dart';
import 'package:github_serach/modules/search/domain/errors/errors.dart';
import 'package:github_serach/modules/search/infra/datasources/i_search_datasource.dart';
import 'package:github_serach/modules/search/infra/models/result_search_model.dart';
import 'package:github_serach/modules/search/infra/repositories/search_repository.dart';
import 'package:mockito/mockito.dart';

class SearchDataSourceMock extends Mock implements ISearchDataSource {}

main() {
  final dataSource = SearchDataSourceMock();
  final repository = SearchRepository(dataSource);
  test('Deve retornar uma lista de ResultSearch', () async {
    when(dataSource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);

    final result = await repository.search("jacob");

    expect(result | null, isA<List<ResultSearch>>());
  });

  test('Deve retornar um DataSourceError se o Datasource falhar', () async {
    when(dataSource.getSearch(any)).thenThrow(Exception());
    final result = await repository.search("jacob");
    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
