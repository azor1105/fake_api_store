import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_api_store/models/product/product_item/product_item.dart';
import 'package:fake_api_store/utils/my_colors.dart';
import 'package:fake_api_store/utils/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemTable extends StatelessWidget {
  const ProductItemTable({
    Key? key,
    required this.onTap,
    required this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(13.r),
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 5,
              color: Colors.grey.shade300,
              offset: const Offset(1, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(13.r),
              child: CachedNetworkImage(
                imageUrl: productItem.image,
                height: 90,
                width: 90,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  productItem.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: MyFonts.w600.copyWith(fontSize: 14.sp),
                ),
              ),
            ),
            Text(
              productItem.category,
              style: MyFonts.w500.copyWith(
                fontSize: 12.sp,
                color: MyColors.c666666,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "\$${productItem.price}",
              style: MyFonts.w600.copyWith(fontSize: 14.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }

  final VoidCallback onTap;
  final ProductItem productItem;
}
