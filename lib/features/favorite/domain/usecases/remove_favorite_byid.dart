import 'package:recipe_app_withai/features/favorite/domain/repository/favorites_repository.dart';

class RemoveFavoriteById {
  final FavoritesRepository repository;

  RemoveFavoriteById(this.repository);

  Future<void> call(String recipeId) async {
    await repository.removeFavoriteById(recipeId);
  }
}
