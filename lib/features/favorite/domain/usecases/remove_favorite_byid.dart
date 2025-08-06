import 'package:recipe_app_withai/features/favorite/domain/entity/recipe_entity.dart';
import 'package:recipe_app_withai/features/favorite/domain/repository/favorites_repository.dart';

class RemoveFavoriteById {
  final FavoritesRepository repository;

  RemoveFavoriteById(this.repository);

  Future<void> call(RecipeEntity recipeId) async {
    await repository.removeFavoriteById(recipeId);
  }
}
