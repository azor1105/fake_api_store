import 'package:fake_api_store/presentation/login/loading/loading_screen.dart';
import 'package:fake_api_store/repository/repository.dart';
import 'package:fake_api_store/services/api_provider.dart';
import 'package:fake_api_store/utils/my_colors.dart';
import 'package:fake_api_store/utils/my_fonts.dart';
import 'package:fake_api_store/utils/my_icons.dart';
import 'package:fake_api_store/utils/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode userNameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  Repository repository = Repository(apiProvider: ApiProvider());

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    userNameFocusNode.dispose();
    passwordFocusNode.dispose();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Image.asset(
                  MyIcons.storeIcon,
                  height: 150,
                  width: 150,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Welcome!',
                  style: MyFonts.w700.copyWith(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'please login to continue our app',
                  style: MyFonts.w500.copyWith(
                    fontSize: 15,
                    color: MyColors.cAAAAAA,
                  ),
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: TextField(
                  focusNode: userNameFocusNode,
                  onSubmitted: (v) {
                    UtilityFunctions.fieldFocusChange(
                        context, userNameFocusNode, passwordFocusNode);
                  },
                  controller: userNameController,
                  style: MyFonts.w500.copyWith(
                    fontSize: 16.sp,
                  ),
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: MyFonts.w700.copyWith(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: TextField(
                  obscuringCharacter: '*',
                  obscureText: true,
                  focusNode: passwordFocusNode,
                  onSubmitted: (v) {
                    passwordFocusNode.unfocus();
                  },
                  controller: passwordController,
                  style: MyFonts.w500.copyWith(
                    fontSize: 16.sp,
                  ),
                  decoration: InputDecoration(
                    labelStyle: MyFonts.w700.copyWith(fontSize: 14),
                    labelText: "Password",
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  height: 60.h,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () async {
                      String userName = userNameController.text;
                      String password = passwordController.text;
                      if (userName == '' || password == '') {
                        UtilityFunctions.getMyToast(message: 'Field is empty');
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoadingScreen(
                              repository:  repository,
                              password: password,
                              userName: userName,
                            ),
                          ),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.r)),
                      backgroundColor: MyColors.black,
                    ),
                    child: Text(
                      'Login',
                      style: MyFonts.w600.copyWith(
                        fontSize: 17.sp,
                        color: MyColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
