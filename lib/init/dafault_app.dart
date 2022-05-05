import 'package:flutter/material.dart';
import 'package:flutter_im_app/router/router_map.dart';
import 'package:get/get.dart';

class DefaultApp {
  void run() {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      title: 'Flutter Project',
      initialRoute: '/login',
      getPages: RouterMap.getPages,

      /// page change Anim
      defaultTransition: Transition.rightToLeft,
    );
  }
}
