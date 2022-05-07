import 'package:flutter/cupertino.dart';
import 'package:flutter_im_app/utils/sp_util.dart';

import 'core/utils/locale.dart';
import 'init/app_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initPre();
  AppInit().run();
}

Future<void> initPre() async {
  await SpUtil().init();
  await LocaleUtils.init();
}
