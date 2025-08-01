import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_withai/core/app_pallet.dart';

class IconNavBar extends StatelessWidget {
  int selectedIndex;
  String image;
  int index;

  IconNavBar({super.key,required this.selectedIndex,required this.image,required this.index});
  final double _scaleNormal = 1.0;
  final double _scaleSelected = 1.2;

  final double _iconSizeNormal = 28.0;
  final double _iconSizeSelected = 32.0;

  final double _paddingSizeNormal = 15.0;
  final double _paddingSizeSelected = 18.0;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: selectedIndex == index ? _scaleSelected : _scaleNormal,
      child: Container(
        padding: EdgeInsets.all(selectedIndex == index ? _paddingSizeSelected : _paddingSizeNormal),
        decoration: selectedIndex == index
            ? const BoxDecoration(
          color: AppPallet.mainColor,
          shape: BoxShape.circle,
        )
            : null,
        child: ImageIcon(
            size: selectedIndex == 4 ? _iconSizeSelected : _iconSizeNormal,

            color: selectedIndex == index ? Colors.white : Colors.grey[700],
            AssetImage(image)),
      ),
    );
  }
}
