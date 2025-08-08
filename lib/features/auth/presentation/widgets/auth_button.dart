import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_withai/core/theme/app_pallet.dart';

class AuthButton extends StatelessWidget{
  String buttomText;
  final VoidCallback onPressed;
  AuthButton({super.key,required this.buttomText,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppPallet.whiteColor,
            fixedSize: Size(395.w, 55.h)
        ),
        onPressed: onPressed, child: Text(buttomText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp,color: AppPallet.mainColor),)
    );
  }
}
