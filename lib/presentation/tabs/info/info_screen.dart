import 'package:fake_api_store/models/product/product_item/product_item.dart';
import 'package:fake_api_store/repository/repository.dart';
import 'package:fake_api_store/services/api_provider.dart';
import 'package:fake_api_store/utils/my_colors.dart';
import 'package:fake_api_store/utils/my_fonts.dart';
import 'package:fake_api_store/utils/my_icons.dart';
import 'package:fake_api_store/utils/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
  final int id;
}

class _InfoScreenState extends State<InfoScreen> {
  late Repository repository;
  int count = 1;
  @override
  void initState() {
    repository = Repository(apiProvider: ApiProvider());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: FutureBuilder(
        future: repository.getProductById(id: widget.id),
        builder: (context, AsyncSnapshot<ProductItem> snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.network(snapshot.data!.image),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 5,
                          child: IconButton(
                            icon: Image.asset(MyIcons.arrowBackIcon),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                        color: MyColors.white,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 7,
                            blurRadius: 7,
                            color: Colors.grey.shade300,
                            offset: const Offset(1, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  snapshot.data!.title,
                                  style: MyFonts.w600.copyWith(
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                snapshot.data!.category,
                                style: MyFonts.w400.copyWith(
                                  fontSize: 14.sp,
                                  color: MyColors.cAAAAAA,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ...List.generate(
                                snapshot.data!.ratingItem.rate.toInt(),
                                (index) => Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Image.asset(MyIcons.starIcon),
                                ),
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Text(
                                "(${snapshot.data!.ratingItem.count} Review)",
                                style: MyFonts.w400.copyWith(fontSize: 11.sp),
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              IconButton(
                                onPressed: () {
                                  if (count > 1) {
                                    setState(() {
                                      count--;
                                    });
                                  }
                                },
                                icon: SvgPicture.asset(MyIcons.minusIcon),
                              ),
                              Text(
                                count.toString(),
                                style: MyFonts.w400.copyWith(fontSize: 14.sp),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                icon: SvgPicture.asset(MyIcons.addIcon),
                              ),
                            ],
                          ),
                          Text(
                            'Description',
                            style: MyFonts.w600.copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Expanded(
                            child: Text(
                              snapshot.data!.description,
                              maxLines: 5,
                              style: MyFonts.w400.copyWith(
                                fontSize: 12.sp,
                                overflow: TextOverflow.ellipsis,
                                color: MyColors.c666666,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Price",
                                    style: MyFonts.w400.copyWith(
                                        fontSize: 12.sp,
                                        color: MyColors.cAAAAAA),
                                  ),
                                  Text(
                                    "\$${(snapshot.data!.price * count).toStringAsFixed(2)}",
                                    style: MyFonts.w700.copyWith(
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(child: SizedBox()),
                              TextButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  bool isSuccess = await repository.addNewCart(
                                    dateTime: DateTime.now().toString(),
                                    userId: 0,
                                    productId: snapshot.data!.id,
                                    quantity: count,
                                  );
                                  if (isSuccess) {
                                    UtilityFunctions.getMyToast(
                                        message: "Successfully added");
                                  } else {
                                    UtilityFunctions.getMyToast(
                                        message: "Something went wrong");
                                  }
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: MyColors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 38.w,
                                    vertical: 13.h,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(MyIcons.shopIcon),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text(
                                        "Add to cart",
                                        style: MyFonts.w600.copyWith(
                                          fontSize: 16.sp,
                                          color: MyColors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: MyColors.black,
              ),
            );
          }
        },
      ),
    );
  }
}
