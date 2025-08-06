class RecipeEntity {
  final String id;
  final String name;
  final String image;
  final int numberOfIngredients;
  final String cookingTime;
  final String category;

  RecipeEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.numberOfIngredients,
    required this.cookingTime,
    required this.category,
  });
}
