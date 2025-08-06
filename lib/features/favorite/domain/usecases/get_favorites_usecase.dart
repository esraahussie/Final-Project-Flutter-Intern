import 'package:recipe_app_withai/features/favorite/domain/entity/recipe_entity.dart';
import 'package:recipe_app_withai/features/favorite/domain/repository/favorites_repository.dart';

class GetFavoritesUsecase {
  final FavoritesRepository repository;

  GetFavoritesUsecase(this.repository);

  Future<List<RecipeEntity>> call() async {
    return await repository.getFavorites();
  }
}
