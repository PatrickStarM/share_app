import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileThreePage extends StatelessWidget {
  const ProfileThreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color1 = Color(0xff83a4d4);
    final Color color2 = Color(0xffb6fbff);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // 顶部渐变容器，下方两角圆弧
            height: 360,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(.6)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                const Text(
                  "About Me",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        // 头像容器
                        height: double.infinity,
                        margin: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 10,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            "http://www.patrickstarm.top:9092/imgs/2022/09/17/63259615c133a.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        // 顶部橙色信息框
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("Flutter Developer"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Patrick - 派大星",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18, color: Colors.red),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.location_on,
                        size: 16.0, color: Colors.grey),
                    Text(
                      "120 Conch Street, Bikini Bottom, Pacific Ocean",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  // 社交按钮
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.qq),
                      color: Colors.blue,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.weixin),
                      color: Colors.green,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.weibo),
                      color: Colors.red.shade600,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        // 底部渐变容器
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 16,
                        ),
                        margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).primaryColor.withOpacity(.6)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          // 行布局的图标按钮
                          children: <Widget>[
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(FontAwesomeIcons.user),
                              color: Colors.white,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.location_on),
                              color: Colors.white,
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                              color: Colors.white,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.message),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        // 中间的爱心悬浮按钮
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {},
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppBar(
            // AppBar，最后放，不然会被后面的组件覆盖掉
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
            ],
          )
        ],
      ),
    );
  }
}
