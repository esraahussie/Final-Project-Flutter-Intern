import 'package:recipe_app_withai/core/entity/recipe_entity.dart';
import 'package:recipe_app_withai/features/recipe_details/domain/entities/ingredient_entity.dart';
import 'package:recipe_app_withai/features/recipe_details/domain/entities/nutrition_entity.dart';

class DummyRecipeDataSource {
  final List<RecipeEntity> favorites = [
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
      ingredients: [
        IngredientEntity(name: 'Spaghetti', quantity: '200g', unit: 'grams'),
        IngredientEntity(name: 'Ground beef', quantity: '200g', unit: 'grams'),
        IngredientEntity(
            name: 'Tomato sauce', quantity: '200ml', unit: 'milliliters'),
        IngredientEntity(name: 'Onion', quantity: '1', unit: 'piece'),
      ],
      nutrition: [
        NutritionEntity(name: 'Calories', quantity: '400', unit: 'kcal'),
        NutritionEntity(name: 'Protein', quantity: '20', unit: 'g'),
        NutritionEntity(name: 'Carbohydrates', quantity: '50', unit: 'g'),
        NutritionEntity(name: 'Fat', quantity: '10', unit: 'g'),
      ],
    )..servings = 4,
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
      ingredients: [
        IngredientEntity(name: 'Chicken', quantity: '500g', unit: 'grams'),
        IngredientEntity(
            name: 'Curry powder', quantity: '2 tbsp', unit: 'tbsp'),
        IngredientEntity(name: 'Tomato', quantity: '2', unit: 'piece'),
        IngredientEntity(name: 'Onion', quantity: '1', unit: 'piece'),
      ],
      nutrition: [
        NutritionEntity(name: 'Calories', quantity: '500', unit: 'kcal'),
        NutritionEntity(name: 'Protein', quantity: '30', unit: 'g'),
        NutritionEntity(name: 'Carbohydrates', quantity: '40', unit: 'g'),
        NutritionEntity(name: 'Fat', quantity: '15', unit: 'g'),
      ],
    )..servings = 6,
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
      ingredients: [
        IngredientEntity(name: 'Beef patty', quantity: '200g', unit: 'grams'),
        IngredientEntity(name: 'Burger bun', quantity: '2', unit: 'piece'),
        IngredientEntity(name: 'Lettuce', quantity: '1', unit: 'piece'),
        IngredientEntity(name: 'Tomato', quantity: '1', unit: 'piece'),
      ],
      nutrition: [
        NutritionEntity(name: 'Calories', quantity: '300', unit: 'kcal'),
        NutritionEntity(name: 'Protein', quantity: '20', unit: 'g'),
        NutritionEntity(name: 'Carbohydrates', quantity: '30', unit: 'g'),
        NutritionEntity(name: 'Fat', quantity: '10', unit: 'g'),
      ],
    )..servings = 2,
  ];
}
