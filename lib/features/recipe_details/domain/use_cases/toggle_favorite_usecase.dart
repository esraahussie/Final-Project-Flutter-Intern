import 'package:recipe_app_withai/features/recipe_details/domain/repositories/recipe_details_repo.dart';

class ToggleFavoriteUsecase {
  final RecipeDetailsRepository repository;
  ToggleFavoriteUsecase(this.repository);

  Future<void> call(String recipeId) async {
    await repository.toggleFavorite(recipeId);
  }
}
