import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hornblastersadmin/UI/buttons.dart';
import 'package:hornblastersadmin/UI/dashboard/dashboard.dart';
import 'package:hornblastersadmin/UI/signin/signin.dart';

import 'UI/splashscreen/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/SplashScreen', page: () => const SplashScreen()),
        GetPage(name: '/SignIn', page: () => SignIn()),
        GetPage(name: '/Dashboard', page: () => Dashboard()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'HornBlasters',
      home:  Buttons(),
    );
  }
}
