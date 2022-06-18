import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController{

  var data = [].obs ;

  void getdata() async{
    CollectionReference usersref = FirebaseFirestore.instance.collection('Pic_Vid');
    await usersref.get().then((value){
      value.docs.forEach((element) {
        data.add(element.data());
      });
    });
  }






}