import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_api_store/models/product/product_item/product_item.dart';
import 'package:fake_api_store/utils/my_colors.dart';
import 'package:fake_api_store/utils/my_fonts.dart';
import 'package:flutter/material.dart';

class ProductItemOnCartScreen extends StatelessWidget {
  const ProductItemOnCartScreen({
    Key? key,
    required this.onTap,
    required this.quantity,
    required this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              spreadRadius: 6,
              blurRadius: 6,
              color: Colors.grey.shade300,
              offset: const Offset(1, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: productItem.image,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              width: 6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    productItem.title,
                    overflow: TextOverflow.ellipsis,
                    style: MyFonts.w700.copyWith(fontSize: 14),
                  ),
                ),
                Text(
                  productItem.category,
                  style: MyFonts.w600.copyWith(
                    fontSize: 14,
                    color: MyColors.c666666,
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Text(
                  "\$${(productItem.price * quantity).toStringAsFixed(2)}",
                  style: MyFonts.w700.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Column(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Text(
                  quantity.toString(),
                  style: MyFonts.w500.copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final VoidCallback onTap;
  final ProductItem productItem;
  final int quantity;
}
