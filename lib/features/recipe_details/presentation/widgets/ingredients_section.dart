import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_withai/core/app_pallet.dart';
import 'package:recipe_app_withai/features/recipe_details/domain/entities/ingredient_entity.dart';

class IngredientsSection extends StatelessWidget {
  final List<IngredientEntity> ingredients;

  const IngredientsSection({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Ingredients: ${ingredients.length}",
              style: TextStyle(fontSize: 16.sp, color: AppPallet.textColor)),
          SizedBox(height: 12.h),
          ...ingredients.map((ingredient) => Padding(
                padding: EdgeInsets.all(
                  8.h,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                                radius: 18,
                                backgroundColor: AppPallet.grayColor),
                            SizedBox(width: 8.w),
                            Text(ingredient.name,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: AppPallet.textColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text('${ingredient.quantity} pcs',
                            style: TextStyle(fontSize: 18.sp)),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Divider(thickness: 1, color: AppPallet.textColor),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
