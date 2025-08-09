import 'package:recipe_app_withai/features/home/domian/recipe_repository.dart';

import 'package:recipe_app_withai/features/home/domian/recipe_entity.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final List<RecipeEntity> _recipes = [];

  @override
  List<RecipeEntity> getAllRecipes() => _recipes;

  @override
  void addRecipe(RecipeEntity recipe) {
    _recipes.add(recipe);
  }

  @override
  void toggleFavorite(RecipeEntity recipe) {
    final index = _recipes.indexOf(recipe);
    if (index != -1) {
      _recipes[index] = RecipeEntity(
        title: recipe.title,
        category: recipe.category,
        ingredientsCount: recipe.ingredientsCount,
        description: recipe.description,
        ingredients: recipe.ingredients,
        durationMinutes: recipe.durationMinutes,
        isFavorite: !recipe.isFavorite,
      );
    }
  }

  @override
  List<RecipeEntity> getFavoriteRecipes() =>
      _recipes.where((r) => r.isFavorite).toList();
}

