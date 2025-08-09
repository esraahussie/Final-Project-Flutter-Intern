import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/quickalert.dart';
import 'package:recipe_app_withai/core/theme/app_pallet.dart';
import 'package:recipe_app_withai/core/utils/validators.dart';
import 'package:recipe_app_withai/features/auth/presentation/manager/auth_bloc.dart';
import 'package:recipe_app_withai/features/auth/presentation/pages/sign_in_page.dart';
import 'package:recipe_app_withai/features/auth/presentation/widgets/auth_button.dart';
import 'package:recipe_app_withai/features/auth/presentation/widgets/auth_field.dart';
import 'package:recipe_app_withai/features/auth/presentation/widgets/check_box.dart';
import 'package:recipe_app_withai/features/auth/presentation/widgets/login_text_with_divider.dart';
import 'package:recipe_app_withai/features/auth/presentation/widgets/social_sign_in.dart';


class SignUp extends StatefulWidget {
  static const routeName = "SignUp";
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  bool isChecked = false;

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.mainColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cover.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Color overlay
          Container(
            color: AppPallet.mainColor.withOpacity(0.2), // Adjust opacity
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SingleChildScrollView(
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthFailure) {
                        Navigator.of(context, rootNavigator: true).popUntil((route) => route.isFirst);
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Sign-Up Failed',
                          text: state.message ?? 'Something went wrong',
                        );
                        print("ERROR MESSAGE: ${state.message}");
                      }
                      if (state is AuthLoading) {
                        Navigator.of(context, rootNavigator: true).popUntil((route) => route.isFirst);
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.loading,
                          title: 'Signing Up',
                          text: 'Please wait...',
                        );
                      }
                      if (state is AuthSuccess) {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          title: 'Sign-Up Successful',
                          text: 'Welcome!',
                          autoCloseDuration: const Duration(seconds: 2),
                        );

                        // Navigate after delay to allow user to see success alert
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.of(context)
                              .pushReplacementNamed(SignIn.routeName);
                        });
                      }
                    },
                    builder: (context, state) {
                      return Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/logo.png",width: 128.w,height: 128.h,),
                            Text("CREATE NEW ACCOUNT"),
                            SizedBox(
                              height: 40.h,
                            ),
                            AuthField(
                              validator: validateName,
                              prefixIcon: Icons.person_2_outlined,
                              headName: "Full Name",
                              controller: nameController,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            AuthField(
                              prefixIcon: Icons.person_2_outlined,
                              headName: "Email",
                              controller: emailController,
                              validator: validateEmail,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            AuthField(
                              validator: validatePhone,
                              prefixIcon: Icons.person_2_outlined,
                              headName: "Phone",
                              controller: phoneController,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            AuthField(
                              validator: validatePassword,
                              prefixIcon: Icons.lock_outline_rounded,
                              suffixIcon:Icons.visibility_outlined ,
                              headName: "Password",
                              controller: passwordController,
                              obscureText: true,

                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            MyCheckBox(
                                onChanged: (val){
                                  setState(() {
                                    isChecked = val!;
                                  });
                            }
                                ,isChecked: isChecked, text: "By creating an account you agree to terms and conditions"),

                        AuthButton(
                              buttomText: "Register",
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) return;

                                if (!isChecked) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("You must agree to the terms and conditions."),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                context.read<AuthBloc>().add(AuthSignUp(
                                  phone: phoneController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  name: nameController.text.trim(),
                                ));

                              },
                            ),
                            LoginWithDivider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/facebook.png",width: 66.w,height: 66.h,),
                                SizedBox(width: 10.w,),
                                SocialSignInButton(authEvent: AuthGoogleSignIn(),imgUrl: "assets/icons/Google.png",),
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(SignIn.routeName);
                                },
                                child: Text("Do you have account ? Login Now",style: TextStyle(color: AppPallet.whiteColor),))
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
