import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _inputWidget(),
    );
  }

  _toHomePage() {
    //
    Get.toNamed('/home');
  }

  _inputWidget() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.10),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.2),
              image: const DecorationImage(
                  image: AssetImage("assert/imgs/zhuzhu.png"),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Zhu Diao IM",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Row(
            children: [
              TextButton(onPressed: () {}, child: Text('Facebook'), style: ButtonStyle()),
              TextButton(onPressed: () {}, child: Text('Facebook'))
            ],
          ),
        ],
      ),
    );
  }
}
