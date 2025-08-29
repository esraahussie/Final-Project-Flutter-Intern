
import 'package:recipe_app_withai/features/home/data/models/recipe_model.dart';
import 'package:recipe_app_withai/features/home/domain/entities/recipe_entity.dart';

abstract class HomeRepository {
  List<RecipeModel> getAllRecipes();
  void addRecipe(RecipeModel recipe);
  void toggleFavorite(RecipeModel recipe);
  List<RecipeModel> getFavoriteRecipes();

  // Remote methods for Supabase integration
  Future<void> refreshFromRemote();
  Future<List<RecipeModel>> searchRemote(String query);
  Future<List<RecipeModel>> getSuggestionsRemote({int limit = 5});
  Future<void> addRecipeRemote(RecipeModel recipe);
}