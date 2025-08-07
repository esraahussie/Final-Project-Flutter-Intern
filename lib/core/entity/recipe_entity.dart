import 'package:recipe_app_withai/features/recipe_details/domain/entities/ingredient_entity.dart';
import 'package:recipe_app_withai/features/recipe_details/domain/entities/nutrition_entity.dart';

class RecipeEntity {
  final String id;
  final String name;
  final String image;
  final int numberOfIngredients;
  final String cookingTime;
  final String category;
  bool isFavorite = false;
  final String? description;
  final String? instructions;
  final List<String>? directions;
  final List<IngredientEntity>? ingredients;
  final List<NutritionEntity>? nutrition;
  var servings;

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

  RecipeEntity copyWith({
    String? id,
    String? name,
    String? image,
    int? numberOfIngredients,
    String? cookingTime,
    String? category,
    bool? isFavorite,
    String? description,
    String? instructions,
    List<String>? directions,
    List<IngredientEntity>? ingredients,
    List<NutritionEntity>? nutrition,
  }) {
    return RecipeEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      numberOfIngredients: numberOfIngredients ?? this.numberOfIngredients,
      cookingTime: cookingTime ?? this.cookingTime,
      category: category ?? this.category,
      description: description ?? this.description,
      instructions: instructions ?? this.instructions,
      directions: directions ?? this.directions,
      ingredients: ingredients ?? this.ingredients,
      nutrition: nutrition ?? this.nutrition,
    )..isFavorite = isFavorite ?? this.isFavorite;
  }
}
