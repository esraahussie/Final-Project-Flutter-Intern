import 'package:recipe_app_withai/core/entity/recipe_entity.dart';

abstract class FavoritesRepository {
  Future<List<RecipeEntity>> getFavorites();
  Future<void> removeFavoriteById(String recipeId);
}
