import 'package:fake_api_store/presentation/tabs/user/detail_info/widgets/text_underline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/my_colors.dart';
import '../../../../../utils/my_fonts.dart';

class RowInfoItem extends StatelessWidget {
  const RowInfoItem({
    Key? key,
    required this.infoOfTitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: MyFonts.w500.copyWith(
            fontSize: 18.sp,
            color: MyColors.c666666,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                infoOfTitle,
                style: MyFonts.w400.copyWith(
                  fontSize: 18.sp,
                ),
              ),
            ),
            UnderlineOfText(width: MediaQuery.of(context).size.width * 0.55),
          ],
        ),
      ],
    );
  }

  final String title;
  final String infoOfTitle;
}
