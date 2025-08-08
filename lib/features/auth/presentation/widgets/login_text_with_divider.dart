import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_withai/core/theme/app_pallet.dart';

class LoginWithDivider extends StatelessWidget {
  const LoginWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: Divider(
              color:AppPallet.whiteColor ,
              height: 36,
            )),
      ),
      Text("or login with",style: TextStyle(color: AppPallet.whiteColor),),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Divider(
              color: AppPallet.whiteColor,
              height: 36.h,
            )),
      ),
    ]);
  }
}
