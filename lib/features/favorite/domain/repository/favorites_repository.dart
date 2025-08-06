import 'package:recipe_app_withai/features/favorite/domain/entity/recipe_entity.dart';

abstract class FavoritesRepository {
  Future<List<RecipeEntity>> getFavorites();
  Future<void> removeFavoriteById(RecipeEntity recipeId);
}
