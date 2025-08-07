import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_withai/core/widgets/recipe_card.dart';
import 'package:recipe_app_withai/features/favorite/data/repositories/dummy_favorites_repository.dart';
import 'package:recipe_app_withai/features/favorite/domain/usecases/get_favorites_usecase.dart';
import 'package:recipe_app_withai/features/favorite/domain/usecases/remove_favorite_byid.dart';
import 'package:recipe_app_withai/features/favorite/presentation/bloc/favorites_bloc.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = "FavoritePage";
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritesBloc(
          GetFavoritesUsecase(DummyFavoritesRepository()),
          RemoveFavoriteById(DummyFavoritesRepository()))
        ..add(GetFavoritesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Favorites'),
        ),
        body: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesInitialState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoritesLoadedState) {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  final recipe = state.favorites[index];
                  return RecipeCard(
                    imageUrl: recipe.image,
                    category: recipe.category,
                    name: recipe.name,
                    ingredientsCount: recipe.numberOfIngredients,
                    cookingTime: recipe.cookingTime,
                    isFavorite:
                        true, // Assuming all recipes in favorites are favorite
                    onFavoriteToggle: () {
                      context
                          .read<FavoritesBloc>()
                          .add(RemoveFavoriteEvent(recipe.id));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('${recipe.name} removed from favorites'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      context.read<FavoritesBloc>().add(GetFavoritesEvent());
                    },
                  );
                },
              );
            } else if (state is FavoritesErrorState) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
