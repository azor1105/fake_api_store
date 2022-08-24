import 'package:fake_api_store/presentation/tabs/cart/cart_screen.dart';
import 'package:fake_api_store/presentation/tabs/home/home_screen.dart';
import 'package:fake_api_store/presentation/tabs/tab_box/widgets/botton_navigation_item.dart';
import 'package:fake_api_store/presentation/tabs/user/user_screen.dart';
import 'package:fake_api_store/utils/my_colors.dart';
import 'package:fake_api_store/utils/my_fonts.dart';
import 'package:fake_api_store/utils/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({Key? key}) : super(key: key);

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [const HomeScreen(), const CartScreen(), const UserScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 5,
              blurRadius: 5,
              color: Colors.grey.shade300,
              offset: const Offset(1, 3),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            fixedColor: Colors.black.withOpacity(0.6),
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: MyFonts.w700.copyWith(
              fontSize: 11,
            ),
            unselectedLabelStyle: MyFonts.w700.copyWith(
              fontSize: 11,
            ),
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: currentIndex == 0
                    ? const BottomCircleItem(iconPath: MyIcons.homeIcon)
                    : SvgPicture.asset(
                        MyIcons.homeIcon,
                        color: MyColors.black,
                        height: 20,
                      ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 1
                    ? const BottomCircleItem(iconPath: MyIcons.cartIcon)
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: SvgPicture.asset(
                          MyIcons.cartIcon,
                          height: 20,
                        )),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 2
                    ? const BottomCircleItem(iconPath: MyIcons.profileIcon)
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: SvgPicture.asset(
                          MyIcons.profileIcon,
                          height: 20,
                        )),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
