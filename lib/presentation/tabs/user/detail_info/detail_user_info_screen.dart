import 'package:fake_api_store/presentation/tabs/user/detail_info/widgets/row_info_item.dart';
import 'package:fake_api_store/repository/repository.dart';
import 'package:fake_api_store/utils/my_colors.dart';
import 'package:fake_api_store/utils/my_fonts.dart';
import 'package:fake_api_store/utils/my_icons.dart';
import 'package:fake_api_store/utils/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/user/user_item/user_item.dart';

class DetailUserInfoScreen extends StatefulWidget {
  const DetailUserInfoScreen({
    Key? key,
    required this.repository,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailUserInfoScreen> createState() => _DetailUserInfoScreenState();
  final int id;
  final Repository repository;
}

class _DetailUserInfoScreenState extends State<DetailUserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: FutureBuilder(
        future: widget.repository.getUserById(id: widget.id),
        builder: (context, AsyncSnapshot<UserItem> snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Image.asset(MyIcons.arrowBackIcon),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Image.asset(
                          MyIcons.userImage,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      RowInfoItem(
                        infoOfTitle: UtilityFunctions.capitalize(snapshot.data!.name.firstname),
                        title: "First name",
                      ),
                      SizedBox(height: 25.h),
                      RowInfoItem(
                        infoOfTitle: UtilityFunctions.capitalize(snapshot.data!.name.lastname),
                        title: "Last name",
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      RowInfoItem(
                        infoOfTitle: snapshot.data!.email,
                        title: "Email",
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      RowInfoItem(
                        infoOfTitle: snapshot.data!.phone,
                        title: "Phone",
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Address",
                        style: MyFonts.w700.copyWith(fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      RowInfoItem(
                        infoOfTitle: UtilityFunctions.capitalize(snapshot.data!.addres.city),
                        title: "City",
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      RowInfoItem(
                        infoOfTitle: UtilityFunctions.capitalize(snapshot.data!.addres.street),
                        title: "Street",
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      RowInfoItem(
                        infoOfTitle: snapshot.data!.addres.zipCode,
                        title: "Zip code",
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      RowInfoItem(
                        infoOfTitle: snapshot.data!.addres.geolocation.lat,
                        title: "Lat",
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      RowInfoItem(
                        infoOfTitle: snapshot.data!.addres.geolocation.long,
                        title: "Long",
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.data!.addres.street));
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
        },
      ),
    );
  }
}
