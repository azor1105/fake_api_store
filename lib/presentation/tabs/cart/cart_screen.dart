import 'package:fake_api_store/models/cart/cart_item/cart_item.dart';
import 'package:fake_api_store/models/product/product_item/product_item.dart';
import 'package:fake_api_store/models/user/user_item/user_item.dart';
import 'package:fake_api_store/presentation/tabs/cart/widgets/get_full_name_of_user.dart';
import 'package:fake_api_store/presentation/tabs/cart/widgets/get_product_by_id.dart';
import 'package:fake_api_store/presentation/tabs/cart/widgets/product_item.dart';
import 'package:fake_api_store/presentation/tabs/cart/widgets/shimmer_product_item.dart';
import 'package:fake_api_store/presentation/tabs/home/widgets/category_item.dart';
import 'package:fake_api_store/presentation/tabs/info/info_screen.dart';
import 'package:fake_api_store/repository/repository.dart';
import 'package:fake_api_store/services/api_provider.dart';
import 'package:fake_api_store/utils/my_colors.dart';
import 'package:fake_api_store/utils/my_fonts.dart';
import 'package:fake_api_store/utils/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int selectedUserId = 1;
  bool isLoading = true;
  List<CartItem> selectedUserCartItem = [];
  List<ProductItem> products = [];
  List<UserItem> users = [];
  Repository repository = Repository(apiProvider: ApiProvider());

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final totalInfo = await Future.wait(
      [
        repository.getAllProducts(),
        repository.getAllUsers(),
        repository.getCartByUserId(id: selectedUserId),
      ],
    );
    products = totalInfo[0] as List<ProductItem>;
    users = totalInfo[1] as List<UserItem>;
    selectedUserCartItem = totalInfo[2] as List<CartItem>;
    if (mounted) {
      isLoading = false;
      setState(() {});
    }
  }

  Future<void> updateUI({required int id}) async {
    isLoading = true;
    selectedUserCartItem = await repository.getCartByUserId(id: selectedUserId);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Visibility(
              visible: isLoading,
              child: Expanded(
                child: ListView(
                  children: [
                    ...List.generate(
                      10,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 25.w),
                        child: const ShimmerProductItem(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !isLoading,
              child: SizedBox(
                height: 35.h,
                child: Visibility(
                  visible: !isLoading,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        users.length,
                        (index) => CategoryItem(
                          title: getFullNameOfUser(
                              users: users, id: users[index].id),
                          isSelected: selectedUserId == users[index].id,
                          onTap: () {
                            selectedUserId = users[index].id;
                            setState(() {});
                            updateUI(id: selectedUserId);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Visibility(
              visible: !isLoading,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Text(
                  getFullNameOfUser(users: users, id: selectedUserId),
                  style: MyFonts.w700.copyWith(fontSize: 20),
                ),
              ),
            ),
            Visibility(
              visible: !isLoading,
              child: selectedUserCartItem.isNotEmpty
                  ? Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 25.w),
                        children: [
                          ...List.generate(
                              selectedUserCartItem.length,
                              (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormat('EEEE, MMM d, yyyy').format(
                                          DateTime.parse(
                                            selectedUserCartItem[index]
                                                .dateTime,
                                          ),
                                        ),
                                        style: MyFonts.w500
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      ...List.generate(
                                        selectedUserCartItem[index]
                                            .products
                                            .length,
                                        (indexOfProduct) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h),
                                          child: ProductItemOnCartScreen(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      InfoScreen(
                                                    id: selectedUserCartItem[
                                                            index]
                                                        .products[
                                                            indexOfProduct]
                                                        .productId,
                                                  ),
                                                ),
                                              );
                                            },
                                            quantity:
                                                selectedUserCartItem[index]
                                                    .products[indexOfProduct]
                                                    .quantity,
                                            productItem: getProductById(
                                              products: products,
                                              id: selectedUserCartItem[index]
                                                  .products[indexOfProduct]
                                                  .productId,
                                            )!,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                    ],
                                  )),
                        ],
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Lottie.asset(MyIcons.empty)),
                          Text(
                            "Carts not found",
                            style: MyFonts.w600.copyWith(
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
