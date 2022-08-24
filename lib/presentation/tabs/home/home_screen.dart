import 'package:fake_api_store/models/product/product_item/product_item.dart';
import 'package:fake_api_store/presentation/tabs/home/widgets/category_item.dart';
import 'package:fake_api_store/presentation/tabs/home/widgets/drop_down_button.dart';
import 'package:fake_api_store/presentation/tabs/home/widgets/product_item.dart';
import 'package:fake_api_store/presentation/tabs/home/widgets/search_text_field.dart';
import 'package:fake_api_store/presentation/tabs/home/widgets/shimmer_product_item.dart';
import 'package:fake_api_store/presentation/tabs/info/info_screen.dart';
import 'package:fake_api_store/repository/repository.dart';
import 'package:fake_api_store/services/api_provider.dart';
import 'package:fake_api_store/utils/my_colors.dart';
import 'package:fake_api_store/utils/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> itemsOfDropDownButton = ["No sort", "Ascending", "Descending"];
  String selectedTitleDrop = "No sort";
  int selectedCategory = 0;
  List<String> categories = [];
  List<ProductItem> products = [];
  bool isLoaded = true;
  late Repository repository;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    repository = Repository(
      apiProvider: ApiProvider(),
    );
    final totalInfo = await Future.wait([
      repository.getAllCategories(),
      repository.getAllProducts(),
    ]);
    categories = totalInfo[0] as List<String>;
    categories.insert(0, 'all');
    products = totalInfo[1] as List<ProductItem>;
    if (mounted) {
      isLoaded = false;
      setState(() {});
    }
  }

  void updateUI(String categoryName) async {
    isLoaded = true;
    if (categoryName != 'all') {
      products =
          await repository.getProductByCategory(categoryName: categoryName);
    } else {
      if (selectedTitleDrop == itemsOfDropDownButton[2]) {
        products = await repository.getProductBySortedId(sortKey: 'desc');
      } else if (selectedTitleDrop == itemsOfDropDownButton[1]) {
        products = await repository.getProductBySortedId(sortKey: 'asc');
      } else {
        products = await repository.getAllProducts();
      }
    }
    isLoaded = false;
    setState(() {});
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  children: [
                    Image.asset(MyIcons.menuIcon),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      child: DropDownButtonOfHomeScreen(
                        itemsOfDropDownButton: itemsOfDropDownButton,
                        onChanged: (v) {
                          selectedTitleDrop = v!;
                          setState(() {});
                          if (selectedCategory == 0) {
                            updateUI('all');
                          }
                        },
                        selectedTitleDrop: selectedTitleDrop,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: SearchTextField(
                  searchController: searchController,
                  onChanged: (v) {
                    searchFood(v);
                  },
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 35.h,
                child: Visibility(
                  visible: !isLoaded,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        categories.length,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: CategoryItem(
                            title: categories[index],
                            isSelected: selectedCategory == index,
                            onTap: () {
                              if (selectedCategory != index) {
                                selectedCategory = index;
                                setState(() {});
                                updateUI(categories[index]);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isLoaded,
                child: GridView.count(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 20,
                  children: [
                    ...List.generate(20, (index) => const ProductShimmerItem()),
                  ],
                ),
              ),
              Visibility(
                visible: !isLoaded,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 25,
                  childAspectRatio: 0.9,
                  children: [
                    ...List.generate(
                      products.length,
                      (index) => ProductItemTable(
                        productItem: products[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoScreen(
                                id: products[index].id,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void searchFood(String searchText) async {
    if (searchText == '') {
      updateUI(categories[selectedCategory]);
      setState(() {});
      return;
    } else {
      final searchKey = searchText.toLowerCase();
      final searchedProducts = products.where((element) {
        final nameOfProduct = element.title.toLowerCase();
        return nameOfProduct.contains(searchKey);
      }).toList();
      setState(() {
        products = searchedProducts;
      });
    }
  }
}
