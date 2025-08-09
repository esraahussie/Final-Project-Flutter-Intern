import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_withai/core/theme/app_pallet.dart';

class AuthField extends StatefulWidget {
  IconData prefixIcon;
  IconData? suffixIcon;
  String headName;
  TextEditingController controller;
  bool obscureText;
  String? Function(String?)? validator;

  AuthField({super.key,required this.prefixIcon,required this.headName,required this.controller,this.suffixIcon,this.obscureText=false,required this.validator});

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late bool isObscure;
  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: AppPallet.whiteColor,
        fontSize: 16.sp,
      ),
      obscureText:isObscure ,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "${widget.headName}",
        labelStyle: TextStyle(
          color: AppPallet.whiteColor, // Set the desired color for the label text
        ),
        prefixIcon: Icon(widget.prefixIcon,color: AppPallet.whiteColor,),
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
            color: AppPallet.whiteColor,
          ),
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color:AppPallet.whiteColor), // Default border color
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppPallet.whiteColor), // When user taps on it
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red), // On validation error
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.redAccent), // On error & focus
        ),
          // filled: true,
          // fillColor:Colors.transparent
      ),
    );
  }
}
