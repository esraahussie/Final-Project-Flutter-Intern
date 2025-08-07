import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 12.h),
          ...ingredients.map((ingredient) => Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                            radius: 6, backgroundColor: Colors.grey),
                        SizedBox(width: 8.w),
                        Text(ingredient.name,
                            style: TextStyle(fontSize: 14.sp)),
                      ],
                    ),
                    Text(ingredient.quantity,
                        style: TextStyle(fontSize: 14.sp)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
