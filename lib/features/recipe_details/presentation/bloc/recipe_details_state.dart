import 'package:recipe_app_withai/core/entity/recipe_entity.dart';

class RecipeDetailsState {
  final int tabIndex;
  final String recipeId;
  final RecipeEntity? recipe;
  final bool isLoading;

  RecipeDetailsState({
    this.recipe,
    this.isLoading = false,
    this.tabIndex = 2, // 0: Summary, 1: Ingredients, 2: Directions
    this.recipeId = '',
  });

  RecipeDetailsState copyWith({
    int? tabIndex,
    String? recipeId,
    RecipeEntity? recipe,
    bool? isLoading,
  }) {
    return RecipeDetailsState(
      tabIndex: tabIndex ?? this.tabIndex,
      recipeId: recipeId ?? this.recipeId,
      recipe: recipe ?? this.recipe,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
