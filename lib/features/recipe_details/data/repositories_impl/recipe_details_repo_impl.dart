import 'package:recipe_app_withai/core/data/dummy_recipe_data_source.dart';
import 'package:recipe_app_withai/core/entity/recipe_entity.dart';
import 'package:recipe_app_withai/features/recipe_details/domain/repositories/recipe_details_repo.dart';

class RecipeDetailsRepositoryImpl implements RecipeDetailsRepository {
  final DummyRecipeDataSource _dummyRecipeDataSource = DummyRecipeDataSource();

  @override
  Future<RecipeEntity> getRecipeDetails(String recipeId) async {
    return _dummyRecipeDataSource.favorites
        .firstWhere((recipe) => recipe.id == recipeId);
  }

  @override
  Future<void> toggleFavorite(String recipeId) async {
    final recipe = _dummyRecipeDataSource.favorites
        .firstWhere((recipe) => recipe.id == recipeId);
    recipe.isFavorite = !recipe.isFavorite;
  }
}
