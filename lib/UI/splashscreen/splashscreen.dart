// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:hornblastersadmin/UI/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async{
      // Get.offNamed('/HomeScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                P3,
                P1,
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('HB',style: TextStyle(
                      fontFamily: 'GaleanaCondensed',
                        fontSize: 184,
                        color: P5
                    ),)
                  ],
                ),
              ],
            ),),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: const Text(
                    'Version 1.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: P5,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
