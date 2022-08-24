import 'package:fake_api_store/presentation/login/login/login_screen.dart';
import 'package:fake_api_store/presentation/tabs/tab_box/tab_box_screen.dart';
import 'package:fake_api_store/utils/my_colors.dart';
import 'package:fake_api_store/utils/my_fonts.dart';
import 'package:fake_api_store/utils/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../data/storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    await StorageRepository.getInstance();
    await Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const TabBoxScreen(),
          ),
        );
      },
    );
    String token = StorageRepository.getString(keyOfValue: 'token') ?? '';
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            token == '' ? LoginScreen() : TabBoxScreen(),
      ),
    );
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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Lottie.asset(
                  MyIcons.store,
                  repeat: false,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Fake Store API",
                style: MyFonts.w700.copyWith(fontSize: 20),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Text(
                "Powered by A'zambek",
                style: MyFonts.w500.copyWith(fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// <uses-permission android:name="android.permission.INTERNET" /> ----> permission for using traffic
// flutter packages pub run build_runner build --delete-conflicting-outputs ----> magic command of build runner