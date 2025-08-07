import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DirectionsSection extends StatelessWidget {
  final List<String> directions;

  const DirectionsSection({super.key, required this.directions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Steps: ${directions.length}",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 12.h),
          ...List.generate(directions.length, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Step ${index + 1}",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4.h),
                  Text(
                    directions[index],
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
