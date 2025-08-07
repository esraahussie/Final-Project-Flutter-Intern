part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitialState extends FavoritesState {}

class FavoritesLoadedState extends FavoritesState {
  final List<RecipeEntity> favorites;

  const FavoritesLoadedState(this.favorites);

  @override
  List<Object> get props => [favorites];
}

class FavoritesErrorState extends FavoritesState {
  final String message;

  const FavoritesErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class FavoriteRemovedState extends FavoritesState {
  final String recipeId;

  const FavoriteRemovedState(this.recipeId);

  @override
  List<Object> get props => [recipeId];
}
