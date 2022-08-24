import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../utils/my_colors.dart';
import '../../home/widgets/shimmer_category_item.dart';

class ShimmerProductItem extends StatelessWidget {
  const ShimmerProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: MyColors.white, borderRadius: BorderRadius.circular(13)),
          ),
          const SizedBox(
            width: 6,
          ),
          SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 10,
                ),
                CategoryShimmerItem(width: 110, height: 14),
                SizedBox(
                  height: 10,
                ),
                CategoryShimmerItem(width: 115, height: 12),
                Expanded(child: SizedBox()),
                CategoryShimmerItem(width: 80, height: 14),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
