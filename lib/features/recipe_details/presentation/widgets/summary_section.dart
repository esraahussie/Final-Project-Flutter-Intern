import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_withai/core/entity/recipe_entity.dart';

class SummarySection extends StatelessWidget {
  final RecipeEntity? recipe;

  const SummarySection({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(recipe?.description ?? '',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[700])),
          SizedBox(height: 16.h),
          Text("Nutritions",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: [
              for (final nutrition in recipe!.nutrition!)
                _buildNutritionCircle(
                    nutrition.name, '${nutrition.quantity} ${nutrition.unit}'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildNutritionCircle(String label, String value) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.blue),
          ),
          child: Text(
            value,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 4.h),
        Text(label, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }
}
