import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_withai/features/auth/presentation/manager/auth_bloc.dart';
import 'package:recipe_app_withai/translation/translation_page.dart';

class SocialSignInButton extends StatelessWidget {
  String imgUrl;
  final AuthEvent authEvent;
  SocialSignInButton({super.key,required this.imgUrl,required this.authEvent});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is GoogleAuthSuccess && authEvent is AuthGoogleSignIn) {
          // Handle successful login navigation
          Navigator.pushReplacementNamed(context, TransitionPage.routeName);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (state is! AuthLoading) {
              context.read<AuthBloc>().add(authEvent);
            }
          },
          child: state is AuthLoading
              ? const Center(child: CircularProgressIndicator())
              : Image.asset(imgUrl,height: 66.h,width: 66.w,),
        );
      },
    );
  }
}