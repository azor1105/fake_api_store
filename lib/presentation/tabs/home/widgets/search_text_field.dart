import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/my_colors.dart';
import '../../../../utils/my_fonts.dart';
import '../../../../utils/my_icons.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.searchController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 26,
              right: 17,
              top: 17,
              bottom: 17,
            ),
            child: SvgPicture.asset(MyIcons.searchIcon)),
        filled: true,
        hintText: 'Search...',
        hintStyle: MyFonts.w400.copyWith(
          fontSize: 13.sp,
          color: MyColors.cAAAAAA,
        ),
        fillColor: MyColors.cF3F4F5,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: const BorderSide(width: 3, color: MyColors.cF3F4F5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: const BorderSide(width: 3, color: MyColors.cF3F4F5),
        ),
      ),
    );
  }

  final TextEditingController searchController;
  final ValueChanged<String> onChanged;
}
