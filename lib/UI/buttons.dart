import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hornblastersadmin/UI/constants.dart';
import 'package:hornblastersadmin/UX/dashboard-controller.dart';

class Buttons extends StatelessWidget {
  DashboardController controller = Get.put(DashboardController());
  Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        leading: Container(),
        backgroundColor: P3,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                P3,
                P1,
              ]),
        ),
        child: Column(
          children: [
            Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(flex: 2, child: Container()),
                          Expanded(
                              flex: 9,
                              child: Column(
                                children: [
                                  Container(margin: EdgeInsets.symmetric(vertical: 50), child: ElevatedButton(onPressed: (){Get.toNamed('/SignIn');}, child: Text('signin'))),
                                  Container(margin: EdgeInsets.symmetric(vertical: 50), child: ElevatedButton(onPressed: (){Get.toNamed('/Dashboard');controller.data.clear();
                                  controller.getdata();}, child: Text('Dashboard'))),
                                ],
                              )),
                          Expanded(flex: 2, child: Container()),
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}



