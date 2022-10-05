import 'package:flutter/material.dart';

class UnknowPage extends StatelessWidget {
  const UnknowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("未知页面"),
      ),
      body: const Center(
        child: Text('未知路由页面'),
      ),
    );
  }
}
