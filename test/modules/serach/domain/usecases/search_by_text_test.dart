import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_serach/modules/search/domain/entities/result_serach.dart';
import 'package:github_serach/modules/search/domain/errors/errors.dart';
import 'package:github_serach/modules/search/domain/repositories/search_repository.dart';
import 'package:github_serach/modules/search/domain/usecases/serach_by_text.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements ISearchRepository {}

class FailureSearchMock extends Mock implements FailureSearch {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByText(repository);
  test('Deve retornar uma lista de ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(List<ResultSearch>()));

    final result = await usecase("jacob");
    expect(result, isA<Right>());
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('Deve retornar uma NullTextError caso o parâmetro seja nulo', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(List<ResultSearch>()));

    final result = await usecase(null);
    expect(result.fold(id, id), isA<NullTextError>());
  });

  test('Deve retornar uma EmptyTextError caso a string seja vazia', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(List<ResultSearch>()));

    final result = await usecase("");
    expect(result.fold(id, id), isA<EmptyTextError>());
  });
}
