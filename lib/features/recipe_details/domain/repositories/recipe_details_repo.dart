import 'package:recipe_app_withai/core/entity/recipe_entity.dart';

abstract class RecipeDetailsRepository {
  Future<RecipeEntity> getRecipeDetails(String recipeId);
  Future<void> toggleFavorite(String recipeId);
}
