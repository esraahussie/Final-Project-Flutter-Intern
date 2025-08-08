import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_withai/core/theme/app_pallet.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recipe_app_withai/features/auth/presentation/manager/auth_bloc.dart';
import 'package:recipe_app_withai/features/auth/presentation/pages/sign_up_page.dart';
import 'package:recipe_app_withai/onboarding/introduction_screen.dart';
import 'package:recipe_app_withai/translation/translation_page.dart';


class SplashScreen extends StatefulWidget {
  static const routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.read<AuthBloc>().add(AuthIsUserLoggedIn());
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, TransitionPage.routeName);
          } else if (state is AuthFailure) {
            Navigator.pushReplacementNamed(context, IntroductionScreen.routeName);
          }
      },
      builder: (context, state) {
        return AnimatedSplashScreen(
            splashIconSize: 300,
            splashTransition: SplashTransition.fadeTransition,
            duration: 3000,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: AppPallet.mainColor,
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/logo.png", height: 145.h, width: 146.w,)
              ],
            ),
            nextScreen: state is AuthSuccess?TransitionPage():IntroductionScreen());
      },
    );
  }
}
