import 'package:recipe_app_withai/core/secrets/app_secrets.dart';
import 'package:recipe_app_withai/features/home/data/models/recipe_model.dart';
import 'package:recipe_app_withai/features/home/domain/entities/recipe_entity.dart';
import 'package:recipe_app_withai/features/home/domain/repositories/home_repository.dart';

import 'package:supabase_flutter/supabase_flutter.dart';


class RecipeRepositoryImpl implements HomeRepository {
  final SupabaseClient client = SupabaseClient(
    AppSecrets.SupabaseUrl,
    AppSecrets.SupabaseAnnokey,
  );

  final List<RecipeModel> _recipes = [];

  @override
  List<RecipeModel> getAllRecipes() => List.unmodifiable(_recipes);

  @override
  void addRecipe(RecipeModel recipe) {
    _recipes.add(recipe);
  }

  @override
  void toggleFavorite(RecipeModel recipe) {
    final index = _recipes.indexOf(recipe);
    if (index != -1) {
      _recipes[index] = recipe.copyWith(isFavorite: !recipe.isFavorite);
    }
  }

  @override
  List<RecipeModel> getFavoriteRecipes() =>
      _recipes.where((r) => r.isFavorite).toList();

  @override
  Future<void> refreshFromRemote() async {
    try {
      final data = await client.from('meals').select();
      final List<RecipeModel> mapped =
      (data as List).map((r) => RecipeModel.fromJson(r)).toList();

      _recipes
        ..clear()
        ..addAll(mapped);
    } catch (e) {
      throw Exception('Failed to refresh recipes from remote: $e');
    }
  }

  @override
  Future<List<RecipeModel>> searchRemote(String query) async {
    try {
      final data = await client
          .from('meals')
          .select()
          .ilike('title', '%$query%')
          .order('title');
      return (data as List).map((r) => RecipeModel.fromJson(r)).toList();
    } catch (e) {
      throw Exception('Failed to search recipes: $e');
    }
  }

  @override
  Future<List<RecipeModel>> getSuggestionsRemote({int limit = 5}) async {
    try {
      final data = await client
          .from('meals')
          .select()
          .limit(limit)
          .order('created_at', ascending: false);
      return (data as List).map((r) => RecipeModel.fromJson(r)).toList();
    } catch (e) {
      throw Exception('Failed to get recipe suggestions: $e');
    }
  }

  @override
  Future<void> addRecipeRemote(RecipeModel recipe) async {
    try {
      await client.from('meals').insert(recipe.toJson());
      _recipes.add(recipe);
    } catch (e) {
      throw Exception('Failed to add recipe to remote: $e');
    }
  }
}