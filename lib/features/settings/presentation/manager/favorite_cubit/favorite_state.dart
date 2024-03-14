part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}
final class FieldGetFavoriteProductData extends FavoriteState {
  final String massage;
  const FieldGetFavoriteProductData({required this.massage});
}
final class GetFavoriteProductSuccess extends FavoriteState {
  final List<FavoriteModel> favoriteList; 
  const GetFavoriteProductSuccess( {required this.favoriteList});
}
final class LoadingFavoriteProductData extends FavoriteState {}

final class ProductInFavoriteData extends FavoriteState {}

final class FalseProductInFavoriteData extends FavoriteState {}

