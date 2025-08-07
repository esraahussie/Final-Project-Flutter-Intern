import 'package:recipe_app_withai/core/entity/recipe_entity.dart';
import 'package:recipe_app_withai/features/recipe_details/domain/repositories/recipe_details_repo.dart';

class GetRecipeDetailsUsecase {
  final RecipeDetailsRepository repository;

  GetRecipeDetailsUsecase(this.repository);

  Future<RecipeEntity> call(String recipeId) async {
    return await repository.getRecipeDetails(recipeId);
  }
}
