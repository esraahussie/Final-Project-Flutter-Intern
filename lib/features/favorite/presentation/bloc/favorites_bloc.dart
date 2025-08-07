import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_withai/core/entity/recipe_entity.dart';
import 'package:recipe_app_withai/features/favorite/domain/usecases/get_favorites_usecase.dart';
import 'package:recipe_app_withai/features/favorite/domain/usecases/remove_favorite_byid.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoritesUsecase getFavoritesUsecase;
  final RemoveFavoriteById removeFavoriteById;

  FavoritesBloc(this.getFavoritesUsecase, this.removeFavoriteById)
      : super(FavoritesInitialState()) {
    on<GetFavoritesEvent>(_onGetFavorites);
    on<RemoveFavoriteEvent>(_onRemoveFavorite);
  }

  Future<void> _onGetFavorites(
      GetFavoritesEvent event, Emitter<FavoritesState> emit) async {
    try {
      final favorites = await getFavoritesUsecase();
      emit(FavoritesLoadedState(favorites));
    } catch (e) {
      emit(FavoritesInitialState()); // Handle error appropriately
    }
  }

  Future<void> _onRemoveFavorite(
      RemoveFavoriteEvent event, Emitter<FavoritesState> emit) async {
    try {
      await removeFavoriteById.call(event.recipeId);
      emit(FavoriteRemovedState(event.recipeId));
      final favorites = await getFavoritesUsecase();
      emit(FavoritesLoadedState(favorites));
    } catch (e) {
      emit(FavoritesErrorState(e.toString()));
    }
  }
}
