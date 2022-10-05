import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_app/data/model/user.dart';
import 'package:share_app/utils/sp_utils.dart';

User? user;

class ProfileTwoPage extends StatefulWidget {
  const ProfileTwoPage({Key? key}) : super(key: key);

  @override
  State<ProfileTwoPage> createState() => _ProfileTwoPageState();
}

class _ProfileTwoPageState extends State<ProfileTwoPage> {
  _readSp() {
    setState(() {
      // var user1 = json.decode(SpUtils.get("userInfo"));
      user = User.fromJson(SpUtils.get("userInfo"));
    });
    print("profile---${user?.toJson()}");
  }

  _logout() {
    Navigator.pushNamed(context, "login");
    setState(() {
      SpUtils.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _readSp();
  }

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    );

    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      body: Stack(
        children: <Widget>[
          SizedBox(
            // 背景底图
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              'https://patrick-file.oss-cn-shanghai.aliyuncs.com/img/bg.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 120, 16, 16),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(16),
                        // 头像上浮
                        margin: const EdgeInsets.only(top: 32),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(180),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              // 名片上班部分留出左边距
                              margin: const EdgeInsets.only(left: 100),
                              // 构建名片上半部分
                              child: _buildColumn(context),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            // 构建名片下半部分
                            _buildRow(),
                          ],
                        ),
                      ),
                      // 头像：指定大小，圆角，左外边距
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(user!.avatar),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: const EdgeInsets.only(left: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Colors.white.withAlpha(160),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "User Information",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          leading: const Icon(Icons.person),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                        ListView(
                          shrinkWrap: true,
                          children: infoList
                              .map(
                                (info) => SizedBox(
                                  height: 80,
                                  child: ListTile(
                                    title: Text(info.title),
                                    subtitle: Text(info.subTitle),
                                    leading: Icon(info.icon),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建名片上方区域
  Column _buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(
              user!.nickname,
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: _logout,
              child: const Text(
                "注销",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
        const ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text("Flutter Developer"),
          subtitle: Text("patrick"),
        ),
      ],
    );
  }

  // 构建名片下方一行三列区域
  Row _buildRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: const <Widget>[Text('666'), Text("Likes")],
          ),
        ),
        Expanded(
          child: Column(
            children: const <Widget>[Text('777'), Text("Comments")],
          ),
        ),
        Expanded(
          child: Column(
            children: const <Widget>[Text('888'), Text("Favourites")],
          ),
        ),
      ],
    );
  }
}

// 封装下方列表数据
class Info {
  IconData icon;
  String title;
  String subTitle;

  Info(this.icon, this.title, this.subTitle);
}

List<Info> infoList = [
  Info(Icons.email, 'Email', "patrickstarm@qq.com"),
  Info(Icons.phone, 'Phone', user!.mobile),
  Info(Icons.monetization_on, 'Bonus', user!.bonus.toString()),
  Info(Icons.code, 'Github', 'https://www.github.com'),
  Info(Icons.calendar_view_day, 'Join Date', user!.createTime),
];
