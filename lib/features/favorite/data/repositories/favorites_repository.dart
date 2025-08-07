import 'package:recipe_app_withai/core/data/dummy_recipe_data_source.dart';
import 'package:recipe_app_withai/core/entity/recipe_entity.dart';
import 'package:recipe_app_withai/features/favorite/domain/repository/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final DummyRecipeDataSource _dummyRecipeDataSource = DummyRecipeDataSource();

  @override
  Future<List<RecipeEntity>> getFavorites() async {
    return _dummyRecipeDataSource.favorites;
  }

  @override
  Future<void> removeFavoriteById(String recipeId) async {
    _dummyRecipeDataSource.favorites
        .removeWhere((recipe) => recipe.id == recipeId);
  }
}
