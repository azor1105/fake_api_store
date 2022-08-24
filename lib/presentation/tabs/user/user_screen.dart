import 'package:fake_api_store/models/user/user_item/user_item.dart';
import 'package:fake_api_store/presentation/tabs/cart/widgets/get_full_name_of_user.dart';
import 'package:fake_api_store/presentation/tabs/home/widgets/search_text_field.dart';
import 'package:fake_api_store/presentation/tabs/user/detail_info/detail_user_info_screen.dart';
import 'package:fake_api_store/presentation/tabs/user/widgets/shimmer_user_item.dart';
import 'package:fake_api_store/presentation/tabs/user/widgets/user_info_table.dart';
import 'package:fake_api_store/repository/repository.dart';
import 'package:fake_api_store/services/api_provider.dart';
import 'package:fake_api_store/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Repository repository = Repository(apiProvider: ApiProvider());
  TextEditingController searchController = TextEditingController();
  List<UserItem> users = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    users = await repository.getAllUsers();
    if (mounted) {
      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SearchTextField(
                searchController: searchController,
                onChanged: (v) {
                  searchUser(v);
                },
              ),
            ),
            Visibility(
              visible: isLoading,
              child: Expanded(
                child: ListView(
                  children: List.generate(
                    10,
                    (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                          vertical: 20.h,
                        ),
                        child: const ShimmerUserItem()),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !isLoading,
              child: Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.w,
                        vertical: 15.h,
                      ),
                      child: UserInfoTable(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailUserInfoScreen(
                                repository: repository,
                                id: users[index].id,
                              ),
                            ),
                          );
                        },
                        fullName: getFullNameOfUser(
                            users: users, id: users[index].id),
                        userItem: users[index],
                      ),
                    );
                  },
                  itemCount: users.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void searchUser(String searchingUser) async {
    setState(() {
      isLoading = true;
    });
    if (searchingUser == '') {
      users = await repository.getAllUsers();
      isLoading = false;
      setState(() {});
    } else {
      searchingUser = searchingUser.toLowerCase();
      List<UserItem> updatedUsers = await repository.getAllUsers();
      setState(() {
        users = updatedUsers.where(
          (element) {
            final fullName =
                getFullNameOfUser(users: updatedUsers, id: element.id)
                    .toLowerCase();
            return fullName.contains(searchingUser);
          },
        ).toList();
        isLoading = false;
      });
    }
  }
}
