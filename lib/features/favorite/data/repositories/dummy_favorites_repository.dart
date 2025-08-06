import 'package:recipe_app_withai/features/favorite/domain/entity/recipe_entity.dart';
import 'package:recipe_app_withai/features/favorite/domain/repository/favorites_repository.dart';

class DummyFavoritesRepository implements FavoritesRepository {
  final List<RecipeEntity> _favorites = [
    RecipeEntity(
      id: 'r1',
      name: 'Spaghetti Bolognese',
      image: 'https://example.com/spaghetti.jpg',
      numberOfIngredients: 6,
      cookingTime: '30 mins',
      category: 'Italian',
    ),
    RecipeEntity(
      id: 'r2',
      name: 'Chicken Curry',
      image: 'https://example.com/curry.jpg',
      numberOfIngredients: 8,
      cookingTime: '45 mins',
      category: 'Indian',
    ),
    RecipeEntity(
      id: 'r3',
      name: 'Beef Burger',
      image: 'https://example.com/burger.jpg',
      numberOfIngredients: 5,
      cookingTime: '25 mins',
      category: 'American',
    ),
  ];

  @override
  Future<List<RecipeEntity>> getFavorites() async {
    return _favorites.cast<RecipeEntity>();
  }

  @override
  Future<void> removeFavoriteById(String recipeId) async {
    _favorites.removeWhere((RecipeEntity) => RecipeEntity.id == recipeId);
  }
}
