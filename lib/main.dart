import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_withai/core/theme.dart';
import 'package:recipe_app_withai/features/favorite/presentation/pages/favorite_page.dart';
import 'package:recipe_app_withai/features/home/presentation/pages/home_page.dart';
import 'package:recipe_app_withai/features/profile/presentation/pages/profile_page.dart';
import 'package:recipe_app_withai/features/recipe_details/presentation/pages/recipe_details_page.dart';
import 'package:recipe_app_withai/features/recipe_details/presentation/bloc/recipe_details_bloc.dart';
import 'package:recipe_app_withai/features/recipe_details/domain/use_cases/get_recipe_details_usecase.dart';
import 'package:recipe_app_withai/features/recipe_details/domain/use_cases/toggle_favorite_usecase.dart';
import 'package:recipe_app_withai/features/recipe_details/data/repositories_impl/recipe_details_repo_impl.dart';
import 'package:recipe_app_withai/translation/translation.dart' as translation;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeMode,
        home: translation.Transition(),
        initialRoute: translation.Transition.routeName,
        routes: {
          translation.Transition.routeName: (_) =>
              const translation.Transition(),
          HomePage.routeName: (_) => const HomePage(),
          ProfilePage.routeName: (_) => const ProfilePage(),
          FavoritePage.routeName: (_) => FavoritePage(),
          RecipeDetailsPage.routeName: (context) {
            final recipeId =
                ModalRoute.of(context)!.settings.arguments as String;
            return BlocProvider(
              create: (_) => RecipeDetailsBloc(
                GetRecipeDetailsUsecase(RecipeDetailsRepositoryImpl()),
                ToggleFavoriteUsecase(RecipeDetailsRepositoryImpl()),
              ),
              child: RecipeDetailsPage(recipeId: recipeId),
            );
          },
        },
      ),
    );
  }
}
