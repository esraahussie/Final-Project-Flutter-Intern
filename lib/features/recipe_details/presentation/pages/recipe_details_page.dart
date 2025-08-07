import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                        child: const Icon(Icons.arrow_back),
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
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),

                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.network(
                    recipe.image,
                    width: double.infinity,
                    height: 180.h,
                    fit: BoxFit.cover,
                  ),
                ),

                // Info (Name, Category, Time, Servings)
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(recipe.name,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Category: ${recipe.category}",
                              style: TextStyle(fontSize: 14.sp)),
                          Text("Time: ${recipe.cookingTime} min",
                              style: TextStyle(fontSize: 14.sp)),
                          Text("Servings: ${recipe.servings}",
                              style: TextStyle(fontSize: 14.sp)),
                        ],
                      ),
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

                Divider(thickness: 1, height: 20.h),

                // Section Content
                Expanded(
                  child: IndexedStack(
                    index: tabIndex,
                    children: [
                      SummarySection(recipe: recipe),
                      IngredientsSection(ingredients: recipe.ingredients!),
                      DirectionsSection(directions: recipe.directions!),
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
              fontSize: 14.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          SizedBox(height: 4.h),
          Container(
            height: 2.h,
            width: 40.w,
            color: isSelected ? Colors.black : Colors.transparent,
          )
        ],
      ),
    );
  }
}
