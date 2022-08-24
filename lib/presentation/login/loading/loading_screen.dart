import 'package:fake_api_store/presentation/login/login/login_screen.dart';
import 'package:fake_api_store/repository/repository.dart';
import 'package:fake_api_store/utils/my_colors.dart';
import 'package:fake_api_store/utils/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../data/storage.dart';
import '../../../utils/utility_functions.dart';
import '../../tabs/tab_box/tab_box_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({
    Key? key,
    required this.repository,
    required this.password,
    required this.userName,
  }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
  final String userName;
  final String password;
  final Repository repository;
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    String token = await widget.repository
        .loginUser(userName: widget.userName, password: widget.password);
    if (token != '') {
      StorageRepository.putString(key: 'token', value: token);
      UtilityFunctions.getMyToast(message: "Welcome ${widget.userName}");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TabBoxScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
      UtilityFunctions.getMyToast(message: "Password or login is wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [     
              const SpinKitWave(
                color: MyColors.black,
                size: 60,
              ),
              const SizedBox(height: 20),
              Text(
                "Loading",
                style: MyFonts.w700.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
