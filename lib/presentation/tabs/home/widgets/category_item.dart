import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/my_colors.dart';
import '../../../../utils/my_fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: isSelected ? MyColors.cE5E5E5 : MyColors.black,
        ),
        child: Text(
          title,
          style: MyFonts.w400.copyWith(
              fontSize: 14.sp,
              color: isSelected ? MyColors.black : MyColors.white),
        ),
      ),
    );
  }

  final VoidCallback onTap;
  final bool isSelected;
  final String title;
}
