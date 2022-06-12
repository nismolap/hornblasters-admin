import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      ],
      debugShowCheckedModeBanner: false,
      title: 'HornBlasters',
      home: const SplashScreen(),
    );
  }
}
