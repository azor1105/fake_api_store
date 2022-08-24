import 'package:fake_api_store/presentation/tabs/home/widgets/shimmer_category_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerItem extends StatelessWidget {
  const ProductShimmerItem(
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          Container(
            height: 110,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
            ),
          ),
          const SizedBox(height: 11,),
          const CategoryShimmerItem(width: 80, height: 10),
          const SizedBox(height: 5,),
          const CategoryShimmerItem(width: 65, height: 8),
          const SizedBox(height: 5,),
          const CategoryShimmerItem(width: 45, height: 10),
        ],
      )
    );
  }

}
