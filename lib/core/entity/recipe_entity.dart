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
  // TODO : add Ingredients entity
  // TODO : add Nutritional information entity

  RecipeEntity({
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
