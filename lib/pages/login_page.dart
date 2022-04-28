import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im_app/utils/sp_util.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _inputWidget(),
    );
  }

  _toHomePage() {
    Get.toNamed('/home');
  }

  _inputWidget() {
    TextEditingController _unameController = TextEditingController();
    _unameController.text = SpUtil().getString("userId");
    TextEditingController _passwordController = TextEditingController();
    _passwordController.text = SpUtil().getString("passWord");
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
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _platformLoginButton("Facebook",
                  const AssetImage("assert/icons/icon_facebook.png")),
              _platformLoginButton(
                  "Google", const AssetImage("assert/icons/icon_google.png"))
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "or",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          Container(
            height: 132,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _unameController,
                  autofocus: true,
                  decoration: const InputDecoration(
                      labelText: "User",
                      hintText: "Please Input UserName Or Email",
                      prefixIcon: Icon(Icons.person)),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Input Your PassWord",
                      prefixIcon: Icon(Icons.password)),
                  obscureText: true,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_unameController.text.isNotEmpty &&
                  _unameController.text == _passwordController.text) {
                SpUtil().setString("userId", _unameController.text);
                SpUtil().setString("passWord", _passwordController.text);
                _toHomePage();
              } else {
                print("password or user is invalid");
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.redAccent),
              width: 315,
              height: 46,
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _platformLoginButton(String text, AssetImage assetImage) {
    return InkWell(
      child: GestureDetector(
          onTap: () {},
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.amberAccent)),
              padding: const EdgeInsets.all(10),
              width: 145,
              height: 38,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Image(
                    image: assetImage,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(text, style: const TextStyle(fontSize: 12)),
                ],
              ))),
    );
  }
}
