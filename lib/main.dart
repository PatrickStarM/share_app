import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_app/pages/login_one.dart';
import 'package:share_app/pages/unknow_page.dart';
import 'package:share_app/routes/routes.dart';
import 'package:share_app/theme/my.dart';
import 'package:share_app/utils/sp_utils.dart';

void main() async{
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  await SpUtils.getInstance();

  TargetPlatform platform = defaultTargetPlatform;
  if (platform != TargetPlatform.iOS) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light, // dark是白字，light是黑字
      statusBarIconBrightness: Brightness.dark, // dark黑字，light白字
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool lightMode = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => const UnknowPage()),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: lightMode ? Brightness.light : Brightness.dark,
        // scaffoldBackgroundColor: Colors.grey.shade100,
        // primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Day13Page(),
      ),
    );
  }
}