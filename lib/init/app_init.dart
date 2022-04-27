import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_im_app/init/dafault_app.dart';

class AppInit {
   void run() {
    catchException(() => {DefaultApp().run()});
  }

  ///异常捕获处理
  static void catchException<T>(T Function() callback) {
    //捕获异常的回调
    FlutterError.onError = (FlutterErrorDetails details) {
      reportErrorAndLog(details);
    };
    runZoned<Future<void>>(() async {
      callback();
    }, zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        collectLog(parent, zone, line); // 收集日志
      },
    ));
  }

  //日志拦截, 收集日志
  static void collectLog(ZoneDelegate parent, Zone zone, String line) {
    parent.print(zone, "日志拦截: $line");
  }

  //上报错误和日志逻辑
  static void reportErrorAndLog(FlutterErrorDetails details) {
    if (kDebugMode) {
      print(details);
    }
  }

  // 构建错误信息
  static FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
    return FlutterErrorDetails(stack: stack, exception: Exception());
  }
}
