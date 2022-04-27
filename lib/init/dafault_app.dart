import 'package:flutter/material.dart';
import 'package:flutter_im_app/router/router_map.dart';
import 'package:flutter_im_app/utils/sp_util.dart';
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
      getPages: RouterMap.getPages,

      /// page change Anim
      defaultTransition: Transition.zoom,
    );
  }
}
