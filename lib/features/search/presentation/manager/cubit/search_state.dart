part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}
final class SearchSuccess extends SearchState{}

final class FieldSearch extends SearchState{
  final String massage;
 const FieldSearch({required this.massage});
}

final class SearchLoading extends SearchState{}
