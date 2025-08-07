part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class GetFavoritesEvent extends FavoritesEvent {}

class RemoveFavoriteEvent extends FavoritesEvent {
  final String recipeId;

  const RemoveFavoriteEvent(this.recipeId);

  @override
  List<Object> get props => [recipeId];
}
