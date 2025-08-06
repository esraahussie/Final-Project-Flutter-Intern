import 'package:flutter/material.dart';
import 'package:recipe_app_withai/core/theme.dart';
import 'package:recipe_app_withai/features/favorite/presentation/pages/favorite_page.dart';
import 'package:recipe_app_withai/features/home/presentation/pages/home_page.dart';
import 'package:recipe_app_withai/features/profile/presentation/pages/profile_page.dart';
import 'package:recipe_app_withai/translation/translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      home: Transition(),
      initialRoute: Transition.routeName,
      routes: {
        Transition.routeName: (_) => const Transition(),
        HomePage.routeName: (_) => const HomePage(),
        ProfilePage.routeName: (_) => const ProfilePage(),
        FavoritePage.routeName: (_) => const FavoritePage(),
      },
    );
  }
}
