import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_withai/core/app_pallet.dart';

import '../bloc/recipe_details_bloc.dart';
import '../bloc/recipe_details_event.dart';
import '../bloc/recipe_details_state.dart';
import '../widgets/summary_section.dart';
import '../widgets/ingredients_section.dart';
import '../widgets/directions_section.dart';

class RecipeDetailsPage extends StatefulWidget {
  final String recipeId;
  static const routeName = "RecipeDetailsPage";

  const RecipeDetailsPage({super.key, required this.recipeId});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  @override
  void initState() {
    super.initState();
    // Dispatch event to load the recipe
    context
        .read<RecipeDetailsBloc>()
        .add(LoadRecipeDetailsEvent(widget.recipeId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<RecipeDetailsBloc, RecipeDetailsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.recipe == null) {
              return Center(child: Text("No recipe found"));
            }
            final recipe = state.recipe!;
            final tabIndex = state.tabIndex;

            return Column(
              children: [
                // AppBar
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 32,
                          color: AppPallet.textColor,
                        ),
                      ),
                      // Favorite button
                      GestureDetector(
                        onTap: () {
                          context
                              .read<RecipeDetailsBloc>()
                              .add(ToggleFavoriteEvent(recipe.id));
                        },
                        child: Icon(
                          recipe.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: AppPallet.textColor,
                          size: 32,
                        ),
                      )
                    ],
                  ),
                ),

                // Image
                ClipRRect(
                  child: Image.network(
                    recipe.image,
                    width: double.infinity,
                    height: 235.h,
                    fit: BoxFit.cover,
                  ),
                ),

                // Info (Name, Category, Time, Servings)
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(recipe.name,
                          style: TextStyle(
                              fontSize: 28.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.h),
                      Text(
                          "${recipe.category}.${recipe.cookingTime}.${recipe.servings} servings",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppPallet.grayColor,
                          )),
                    ],
                  ),
                ),

                // Tabs
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTab("Summary", 0, tabIndex, context),
                      _buildTab("Ingredients", 1, tabIndex, context),
                      _buildTab("Directions", 2, tabIndex, context),
                    ],
                  ),
                ),

                // Section Content
                Expanded(
                  child: Column(
                    children: [
                      IndexedStack(
                        index: tabIndex,
                        children: [
                          SummarySection(recipe: recipe),
                          IngredientsSection(ingredients: recipe.ingredients!),
                          DirectionsSection(directions: recipe.directions!),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTab(
      String title, int index, int selectedIndex, BuildContext context) {
    final isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () {
        context.read<RecipeDetailsBloc>().add(ChangeTab(index));
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              color: isSelected ? AppPallet.textColor : AppPallet.grayColor,
            ),
          ),
          SizedBox(height: 4.h),
          Container(
            height: 5.h,
            width: 30.w,
            color: isSelected ? AppPallet.textColor : Colors.transparent,
          )
        ],
      ),
    );
  }
}
