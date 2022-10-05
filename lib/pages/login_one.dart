import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:share_app/data/model/response_result.dart';
import 'package:share_app/utils/sp_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Color color1 = Color(0xffef9393);
final Color color2 = Color(0xffe17dc2);
final Color color3 = Color(0xff998ee0);
final Color color4 = Color(0xff43add0);
final Color color5 = Color(0xff8bdeda);

TextEditingController _phone = TextEditingController();
TextEditingController _password = TextEditingController();

TextStyle titleStyle = const TextStyle(
    color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30);

TextStyle tipStyle = const TextStyle(
    color: Colors.red, fontWeight: FontWeight.w700, fontSize: 16);

class LoginPage01 extends StatefulWidget {
  const LoginPage01({Key? key}) : super(key: key);

  @override
  State<LoginPage01> createState() => _LoginPage01State();
}

class _LoginPage01State extends State<LoginPage01> {
  void _login() async {
    print(_phone);
    print(_password);
    Dio dio = Dio();
    Map<String, dynamic> body = Map();
    body['mobile'] = _phone.text.trim().toString();
    body['password'] = _password.text.trim().toString();

    var response =
        await dio.post('http://42.192.1.98:9081/users/login', data: body);
    if (response.statusCode == 200) {
      print(response.data);
      // User user = User.fromJson(response.data);
      ResponseResult result = ResponseResult.fromJson(response.data);

      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('userInfo', jsonEncode(result.data));
      print(sp.getString("userInfo"));
      Navigator.pushNamed(context, "profile");
      // setState(() {
      //   info = response.data;
      // });
    } else {
      print("Error:\n HttpStatus ${response.statusCode}");
    }

    // getHeaders () {
    //   return {
    //     'Accept':'application/json, text/plain, */*',
    //     'Content-Type':'application/json',
    //     'Authorization':"**",
    //     'User-Aagent':"4.1.0;android;6.0.1;default;A001",
    //     "HZUID":"2",
    //   };
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //解决输入框输入将组件往上挤的bug

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color1, color2, color3],
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color2, color3, color4],
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Icon(
                          Icons.code,
                          color: Colors.white,
                          size: 60,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Coding Life',
                          style: titleStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 3,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  onChanged: (String value) {
                    setState(() {
                      _phone.text = value;
                    });
                    //添加的代码：光标一直在文本框后面
                    _phone.value = TextEditingValue(
                      text: _phone.text,
                      selection: TextSelection.fromPosition(
                        TextPosition(
                          affinity: TextAffinity.downstream,
                          offset: _phone.text.length,
                        ),
                      ),
                    );
                  },
                  controller: _phone,
                  cursorColor: color4,
                  decoration: InputDecoration(
                    hintText: "Phone",
                    // helperText: "请输入正确的手机号",
                    // helperStyle: const TextStyle(color: Colors.red),
                    // helperMaxLines: 1,
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                      child: Icon(
                        Icons.email,
                        color: color4,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 3,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  onChanged: (String value) {
                    setState(() {
                      _password.text = value;
                    });
                    //添加的代码：光标一直在文本框后面
                    _password.value = TextEditingValue(
                      text: _password.text,
                      selection: TextSelection.fromPosition(
                        TextPosition(
                          affinity: TextAffinity.downstream,
                          offset: _password.text.length,
                        ),
                      ),
                    );
                  },
                  controller: _password,
                  cursorColor: color4,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                      child: Icon(
                        Icons.lock,
                        color: color4,
                      ),
                    ),
                    // suffixIcon: IconButton(
                    //   icon: Icon(
                    //     //根据passwordVisible状态显示不同的图标
                    //     passwordVisible ? Icons.visibility : Icons.visibility_off,
                    //     color: Theme.of(context).primaryColorDark,
                    //   ),
                    //   onPressed: () {
                    //     //更新状态控制密码显示或隐藏
                    //     setState(() {
                    //       passwordVisible = !passwordVisible;
                    //     });
                    //   },
                    // ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  color: color4),
              child: MaterialButton(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                onPressed: _login,
                child: Text(
                  'Login',
                  style: titleStyle.copyWith(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Forgot Password ?',
              style: tipStyle,
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an Account ?",
                  style: tipStyle.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                // Text(
                //   "Sing Up",
                //   style: tipStyle.copyWith(
                //     decoration: TextDecoration.underline,
                //   ),
                // ),
                TextButton(
                  onPressed: () {
                    print("已注销---${SpUtils.get("userInfo")}");
                  },
                  child: Text(
                    "Sing Up",
                    style: tipStyle.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
