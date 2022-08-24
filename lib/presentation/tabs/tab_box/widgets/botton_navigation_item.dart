import 'package:fake_api_store/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomCircleItem extends StatelessWidget {
  const BottomCircleItem({
    Key? key,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: MyColors.black,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        iconPath,
        color: MyColors.white,
      ),
    );
  }

  final String iconPath;
}
