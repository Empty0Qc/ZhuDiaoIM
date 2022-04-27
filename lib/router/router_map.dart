import 'package:flutter_im_app/pages/my_home_page.dart';
import 'package:get/get.dart';

import '../pages/login_page.dart';
import '../pages/splash_page.dart';

class RouterMap {
  static List<GetPage> getPages = [
    GetPage(name: '/', page: () => const SplashPage()),
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/home', page: () => const MyHomePage()),
  ];
}
