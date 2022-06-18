import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  void signin() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
    }
  }

}