import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_withai/features/recipe_details/domain/use_cases/get_recipe_details_usecase.dart';
import 'package:recipe_app_withai/features/recipe_details/domain/use_cases/toggle_favorite_usecase.dart';
import 'package:recipe_app_withai/features/recipe_details/presentation/bloc/recipe_details_event.dart';
import 'package:recipe_app_withai/features/recipe_details/presentation/bloc/recipe_details_state.dart';

class RecipeDetailsBloc extends Bloc<RecipeDetailsEvent, RecipeDetailsState> {
  final GetRecipeDetailsUsecase getRecipeDetailsUsecase;
  final ToggleFavoriteUsecase toggleFavoriteUsecase;

  RecipeDetailsBloc(this.getRecipeDetailsUsecase, this.toggleFavoriteUsecase)
      : super(RecipeDetailsState()) {
    on<LoadRecipeDetailsEvent>(_onLoadRecipeDetails);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
    on<ChangeTab>(_onChangeTab);
  }

  Future<void> _onLoadRecipeDetails(
      LoadRecipeDetailsEvent event, Emitter<RecipeDetailsState> emit) async {
    print('Loading recipe details for ID: ${event.recipeId}');
    emit(state.copyWith(isLoading: true));
    try {
      final recipe = await getRecipeDetailsUsecase(event.recipeId);
      print('Recipe loaded successfully: ${recipe.name}');
      emit(state.copyWith(
          recipe: recipe, recipeId: event.recipeId, isLoading: false));
    } catch (e) {
      print('Error loading recipe: $e');
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onToggleFavorite(
      ToggleFavoriteEvent event, Emitter<RecipeDetailsState> emit) async {
    try {
      await toggleFavoriteUsecase.call(event.recipeId);
      final recipe =
          state.recipe?.copyWith(isFavorite: !state.recipe!.isFavorite);
      emit(state.copyWith(recipe: recipe));
    } catch (e) {
      // Handle error appropriately
    }
  }

  void _onChangeTab(ChangeTab event, Emitter<RecipeDetailsState> emit) {
    emit(state.copyWith(tabIndex: event.tabIndex));
  }
}
