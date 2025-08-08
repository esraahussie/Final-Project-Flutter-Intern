import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_withai/core/theme/app_pallet.dart';
import 'package:recipe_app_withai/core/theme/app_pallet.dart';

class IntroPage extends StatefulWidget {
  String title;
  String description;
  String image;
  int pageNumber;
  IntroPage({super.key,required this.pageNumber,required this.image,required this.title,required this.description});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>  with SingleTickerProviderStateMixin{
  int s =1;
  late AnimationController _controller;
  // late Animation<double> _logoScale;
  late Animation<double> _foodScale;
  late Animation<double> _foodOpacity;
  late Animation<Offset> _bgSlide;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _bgSlide =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        );



    // _logoScale = Tween<double>(begin: 0, end: 1).animate(
    //   CurvedAnimation(parent: _controller, curve: const Interval(0.3, 0.6, curve: Curves.easeOutBack)),
    // );

    _foodScale = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.6, 1, curve: Curves.easeOutBack)),
    );

    _foodOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.6, 1)),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: -75.h,
                child: Container(
                  height: 284.h,
                  width: 284.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppPallet.mainColor, width: 1,),
                  ),
                ),
              ),
              SlideTransition(
                position:widget.pageNumber==1?_bgSlide : AlwaysStoppedAnimation<Offset>(Offset.zero),
                child: Container(
                  width: double.infinity,
                  height: 454.h,
                  decoration:  BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // لون الظل
                        spreadRadius: 2, // مدى الانتشار
                        blurRadius: 8,   // درجة النعومة
                        offset: const Offset(0, 4), // الاتجاه (x=0, y=4 يعني لتحت)
                      ),
                    ],
                    color: AppPallet.mainColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150),
                    ),
                  ),

                ),
              ),
              Positioned(
                top: 100.h,
                child:
                // ScaleTransition(
                //   scale: widget.pageNumber == 1
                //       ? _bgSlide
                //       : const AlwaysStoppedAnimation<double>(0.0),

                   Image.asset(
                    "assets/icons/logo.png",
                    height: 98.h,
                    width: 98.w,
                    // color: Colors.white,
                  ),
                ),
              // ),

              Positioned(
                bottom: -65.h,
                child: FadeTransition(
                  opacity:_foodOpacity ,
                  child: ScaleTransition(
                    scale:_foodScale ,
                    child: Container(
                      height: 238.h,
                      width: 238.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(widget.image),
                          fit: BoxFit.cover,
                        ),
                        // border: Border.all(color: Colors.white, width: 4),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
           SizedBox(height: 100.h),
          Text(
            widget.title,
            style:  TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: AppPallet.mainColor),
            textAlign: TextAlign.center,
          ),
           SizedBox(height: 8.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(widget.description, textAlign: TextAlign.center,
              style:  TextStyle(fontSize: 14.sp, color: AppPallet.mainColor),),

          ),
        ],
      );
  }
}
