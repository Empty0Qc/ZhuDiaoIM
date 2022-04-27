import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im_app/utils/sp_util.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _countDown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assert/imgs/splash_img.png"),
                fit: BoxFit.cover)),
        child: Container());
  }

  _countDown() {
    var _duration = const Duration(seconds: 2);
    Future.delayed(_duration, goHomePage);
  }

  goHomePage() {
    Get.offNamed(SpUtil().getBool('isLogin') ? "/home" : '/login');
  }
}
