import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_withai/core/init_dependencies.dart';
import 'package:recipe_app_withai/core/theme/theme.dart';
import 'package:recipe_app_withai/features/auth/presentation/manager/auth_bloc.dart';
import 'package:recipe_app_withai/features/auth/presentation/pages/sign_in_page.dart';
import 'package:recipe_app_withai/features/auth/presentation/pages/sign_up_page.dart';
import 'package:recipe_app_withai/features/favorite/presentation/pages/favorite_page.dart';
import 'package:recipe_app_withai/features/home/presentation/pages/home_page.dart';
import 'package:recipe_app_withai/features/profile/presentation/pages/profile_page.dart';
import 'package:recipe_app_withai/onboarding/custom_intro.dart';
import 'package:recipe_app_withai/onboarding/introduction_screen.dart';
import 'package:recipe_app_withai/onboarding/splash_screen.dart';
import 'package:recipe_app_withai/translation/translation_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => serviceLocator<AuthBloc>(),
        ),
      ],
          child: const MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  //   });
  // }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'Meal Recommendation',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeMode,
        home: SplashScreen(),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (_) =>  SplashScreen(),
          IntroductionScreen.routeName: (_) =>  IntroductionScreen(),
          SignIn.routeName: (_) =>  SignIn(),
          SignUp.routeName: (_) =>  SignUp(),
          TransitionPage.routeName: (_) =>  TransitionPage(),
          HomePage.routeName: (_) =>  HomePage(),
          ProfilePage.routeName: (_) =>  ProfilePage(),
          FavoritePage.routeName: (_) =>  FavoritePage(),
        },
      ),
    );
  }
}
