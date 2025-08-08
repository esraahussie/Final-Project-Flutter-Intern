class RecipeEntity {
  final String title;
  final String category;
  final int ingredientsCount;
  final String description;
  final List<String> ingredients;
  final int durationMinutes;
  final String? imagePath;
  bool isFavorite;

  RecipeEntity({
    required this.title,
    required this.category,
    required this.ingredientsCount,
    required this.description,
    required this.ingredients,
    required this.durationMinutes,
    this.imagePath,
    this.isFavorite = false,
  });
}

