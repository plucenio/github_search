abstract class FailureSearch implements Exception {}

class NullTextError implements FailureSearch {}

class EmptyTextError implements FailureSearch {}

class DataSourceError implements FailureSearch {
  final String message;

  DataSourceError({this.message});
}
