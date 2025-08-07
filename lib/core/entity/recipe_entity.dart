import 'package:recipe_app_withai/features/recipe_details/domain/entities/ingredient_entity.dart';
import 'package:recipe_app_withai/features/recipe_details/domain/entities/nutrition_entity.dart';

class RecipeEntity {
  final String id;
  final String name;
  final String image;
  final int numberOfIngredients;
  final String cookingTime;
  final String category;
  final bool isFavorite = false;
  final String? description;
  final String? instructions;
  final List<String>? directions;
  final List<IngredientEntity>? ingredients;
  final List<NutritionEntity>? nutrition;

  RecipeEntity({
    this.ingredients,
    this.nutrition,
    required this.id,
    required this.name,
    required this.image,
    required this.numberOfIngredients,
    required this.cookingTime,
    required this.category,
    required this.instructions,
    required this.directions,
    required this.description,
  });
}
