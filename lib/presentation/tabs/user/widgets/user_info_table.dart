import 'package:fake_api_store/models/user/user_item/user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/my_colors.dart';
import '../../../../utils/my_fonts.dart';
import '../../../../utils/my_icons.dart';

class UserInfoTable extends StatelessWidget {
  const UserInfoTable({
    Key? key,
    required this.onTap,
    required this.fullName,
    required this.userItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              spreadRadius: 5,
              blurRadius: 5,
              color: Colors.grey.shade300,
              offset: const Offset(1, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      style: MyFonts.w700.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      userItem.email,
                      style: MyFonts.w500.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      userItem.phone,
                      style: MyFonts.w400.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Image.asset(
                  MyIcons.userIcon,
                  height: 40,
                  width: 40,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Image.asset(
                  MyIcons.addressIcon,
                  height: 40,
                  width: 40,
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "City: ${userItem.addres.city}",
                      style: MyFonts.w600.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Street: ${userItem.addres.street}",
                      style: MyFonts.w500.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Zipcode: ${userItem.addres.zipCode}",
                      style: MyFonts.w400.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final VoidCallback onTap;
  final String fullName;
  final UserItem userItem;
}
