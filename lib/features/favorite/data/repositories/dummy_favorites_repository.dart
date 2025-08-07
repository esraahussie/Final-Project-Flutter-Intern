import 'package:recipe_app_withai/core/entity/recipe_entity.dart';
import 'package:recipe_app_withai/features/favorite/domain/repository/favorites_repository.dart';

class DummyFavoritesRepository implements FavoritesRepository {
  final List<RecipeEntity> _favorites = [
    RecipeEntity(
      id: '1',
      name: 'Spaghetti Bolognese',
      image: 'https://picsum.photos/200',
      numberOfIngredients: 6,
      cookingTime: '30 mins',
      category: 'Italian',
      description: 'A classic Italian pasta dish with a rich meat sauce.',
      instructions: 'Cook spaghetti, prepare sauce, combine and serve.',
      directions: [
        'Cook spaghetti',
        'Prepare sauce',
        'Combine and serve',
      ],
    ),
    RecipeEntity(
      id: '2',
      name: 'Chicken Curry',
      image: 'https://picsum.photos/200',
      numberOfIngredients: 8,
      cookingTime: '45 mins',
      category: 'Indian',
      description: 'A flavorful chicken curry with aromatic spices.',
      instructions: 'Cook chicken, add spices, simmer and serve.',
      directions: [
        'Cook chicken',
        'Add spices',
        'Simmer and serve',
      ],
    ),
    RecipeEntity(
      id: '3',
      name: 'Beef Burger',
      image: 'https://picsum.photos/200',
      numberOfIngredients: 5,
      cookingTime: '25 mins',
      category: 'American',
      description: 'A juicy beef burger with fresh toppings.',
      instructions: 'Grill beef patty, assemble burger, and serve.',
      directions: [
        'Grill beef patty',
        'Assemble burger',
        'Serve with fries',
      ],
    ),
  ];

  @override
  Future<List<RecipeEntity>> getFavorites() async {
    return _favorites.cast<RecipeEntity>();
  }

  @override
  Future<void> removeFavoriteById(String recipeId) async {
    _favorites.removeWhere((recipe) => recipe.id == recipeId);
  }
}
