import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hornblastersadmin/UX/dashboard-controller.dart';

DashboardController controller = Get.put(DashboardController());

class SignInController extends GetxController {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var adminusername;

  var adminpass;

  final box = GetStorage();
  var data;

  void isregistered() {
    if (box.read('isregister') == true) {
      Get.offAllNamed('/Dashboard');
      controller.data.clear();
      controller.getdata();
    } else {
      Get.offAllNamed('/SignIn');
    }
  }

  void signin() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      getdata();
    }
  }

  void Logout() {
    box.write('isregister', false);
    Get.offAllNamed('/SplashScreen');
  }

  getdata() {
    data = FirebaseFirestore.instance.collection('Admin').doc('Auth');
    data.get().then((value) {
      if (value.data()['user'] == adminusername) {
        if (value.data()['pass'] == adminpass) {
          Get.toNamed('/Dashboard');
          box.write('isregister', true);
          controller.data.clear();
          controller.getdata();
        } else {
          Get.snackbar('Invalid email/password credentials.', '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red[300]);
        }
      } else {
        Get.snackbar('Invalid email/password credentials.', '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red[300]);
      }
    });
  }
}
