import 'package:flutter/material.dart';
import 'package:share_app/pages/login_one.dart';
import 'package:share_app/pages/profile.dart';

final Map<String,Widget Function(BuildContext)> routes = {
  'login': (context) => const LoginPage01(),
  'profile': (context) => const ProfileTwoPage(),
};