import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        leading: IconButton(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color(0xff2d4154),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        color: Colors.blue.shade100,
      ),
    );
  }
}
