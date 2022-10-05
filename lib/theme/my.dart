import 'package:flutter/material.dart';
import 'package:share_app/pages/profile_three.dart';
import 'package:share_app/theme/themes.dart';

class Day13Page extends StatelessWidget {
  const Day13Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      home: Day13PageHome(),
    );
  }
}

class Day13PageHome extends StatelessWidget {
  const Day13PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // backgroundColor: ,
        title: const Text("我的"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("ElevateButton"),
            ),
            TextField(

            ),

            Text("Info"),
            Container(
              height: 200,
              color: Theme.of(context).primaryColor.withOpacity(.4),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "menu"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts), label: "me"),
        ],
      ),
    );
  }
}
