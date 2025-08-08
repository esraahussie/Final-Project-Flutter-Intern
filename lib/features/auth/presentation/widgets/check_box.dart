import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_withai/core/theme/app_pallet.dart';

class MyCheckBox extends StatelessWidget {
  bool isChecked;
  final ValueChanged<bool?> onChanged;
  String text;
  MyCheckBox({super.key,required this.isChecked,required this.text,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      side: BorderSide(color:AppPallet.whiteColor),
      activeColor: AppPallet.mainColor,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(text,style: TextStyle(color: AppPallet.whiteColor,fontSize: 15.sp),),
      value: isChecked,
      onChanged: onChanged
    );
  }
}
