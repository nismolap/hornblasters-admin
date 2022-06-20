import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hornblastersadmin/UI/add-edit/add-edit.dart';
import 'package:hornblastersadmin/UI/dashboard/dashboard.dart';
import 'package:hornblastersadmin/UI/signin/signin.dart';

import 'UI/splashscreen/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/SplashScreen', page: () => SplashScreen()),
        GetPage(name: '/SignIn', page: () => SignIn()),
        GetPage(name: '/Dashboard', page: () => Dashboard()),
        GetPage(name: '/AddEdit', page: () => AddEdit()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'HornBlasters',
      home:  SplashScreen(),
    );
  }
}