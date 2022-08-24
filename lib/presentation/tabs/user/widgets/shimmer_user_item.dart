import 'package:fake_api_store/presentation/tabs/home/widgets/shimmer_category_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUserItem extends StatelessWidget {
  const ShimmerUserItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CategoryShimmerItem(width: 80, height: 15),
                    SizedBox(
                      height: 3,
                    ),
                    CategoryShimmerItem(width: 100, height: 12),
                    SizedBox(
                      height: 3,
                    ),
                    CategoryShimmerItem(width: 90, height: 12),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CategoryShimmerItem(width: 80, height: 15),
                  SizedBox(
                    height: 3,
                  ),
                  CategoryShimmerItem(width: 100, height: 12),
                  SizedBox(
                    height: 3,
                  ),
                  CategoryShimmerItem(width: 90, height: 12),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
