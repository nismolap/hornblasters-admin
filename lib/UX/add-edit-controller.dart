import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hornblastersadmin/UI/constants.dart';
import 'package:hornblastersadmin/UX/dashboard-controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

DashboardController controller = Get.put(DashboardController());

class AddEditController extends GetxController {
  var pagetype = ''.obs;

  var type = ''.obs;

  int id = 0;

  var title = ''.obs;

  var url = ''.obs;

  var uri = ''.obs;
  var uri2 = ''.obs;

  var iname = ''.obs;
  var iname2 = ''.obs;

  final ImagePicker picker = ImagePicker();
  final ImagePicker picker2 = ImagePicker();
  File? file;
  File? file2;

  var selected;

  List types = ['image', 'video'];

  void uploadingimage() {
    Get.defaultDialog(
      title: '',
      barrierDismissible: false,
      content: Column(
        children: [
          CircularProgressIndicator(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Text(
              'Please wait while the file is uploaded',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      radius: 20,
    );
  }

  pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image!.path.isNotEmpty) {
      file = File(image.path);

      uploadingimage();
      var getnameimage = basename(image.path);
      var refstor = FirebaseStorage.instance.ref('images/$getnameimage');
      await refstor.putFile(file!);
      var geturl = await refstor.getDownloadURL();
      uri.value = await geturl;
      iname.value = getnameimage;
      Get.back();
      Get.snackbar('file uploaded', '',
          colorText: P5,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green);
    }
  }

  pickVideo() async {
    final XFile? image = await picker.pickVideo(source: ImageSource.gallery);

    if (image!.path.isNotEmpty) {
      file = File(image.path);

      uploadingimage();
      var getnameimage = basename(image.path);
      var refstor = FirebaseStorage.instance.ref('videos/$getnameimage');
      await refstor.putFile(file!);
      var geturl = await refstor.getDownloadURL();
      uri.value = await geturl;
      iname.value = getnameimage;
      Get.back();
      Get.snackbar('file uploaded', '',
          colorText: P5,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green);
    }
  }

  pickThm() async {
    final XFile? image = await picker2.pickImage(source: ImageSource.gallery);

    if (image!.path.isNotEmpty) {
      file2 = File(image.path);

      uploadingimage();
      var getnameimage = basename(image.path);
      var refstor = FirebaseStorage.instance.ref('videos/$getnameimage');
      await refstor.putFile(file2!);
      var geturl = await refstor.getDownloadURL();
      uri2.value = await geturl;
      iname2.value = getnameimage;
      Get.back();
      Get.snackbar('file uploaded', '',
          colorText: P5,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green);
    }
  }

  void save() async {
    if (pagetype.value == 'add') {
      var data = FirebaseFirestore.instance.collection('Pic_Vid');
      await data.get().then((value) {
        CollectionReference wregidt =
            FirebaseFirestore.instance.collection('Pic_Vid');
        wregidt.doc('${int.parse(value.docs.last.id) + 1}').set({
          'id': int.parse(value.docs.last.id) + 1,
          'title': title.value,
          'url': url.value,
          'uri': uri.value,
          'type': type.value,
          'iname': iname.value,
          'thm' : uri2.value,
          'tname': iname2.value,
        });
      }).catchError((e) {
        CollectionReference wregidt =
            FirebaseFirestore.instance.collection('Pic_Vid');
        wregidt.doc('0').set({
          'id': 0,
          'title': title.value,
          'url': url.value,
          'uri': uri.value,
          'type': type.value,
          'iname': iname.value,
          'thm' : uri2.value,
          'tname': iname2.value,
        });
      });
      Get.snackbar('file added', '',
          colorText: P5,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green);
      Get.toNamed('/Dashboard');
      controller.data.clear();
      controller.getdata();
    } else {
      CollectionReference wregidt =
          FirebaseFirestore.instance.collection('Pic_Vid');
      await wregidt.doc('$id').set({
        'id': id,
        'title': title.value,
        'url': url.value,
        'uri': uri.value,
        'type': type.value,
        'iname': iname.value,
        'thm' : uri2.value,
        'tname': iname2.value,
      });
      Get.snackbar('file updated', '',
          colorText: P5,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green);
      Get.toNamed('/Dashboard');
      controller.data.clear();
      controller.getdata();
    }
  }

  void delete() async {
    CollectionReference wregidt =
        FirebaseFirestore.instance.collection('Pic_Vid');
    await wregidt.doc('${id}').delete();
    Get.snackbar('file deleted', '',
        colorText: P5,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green);
    Get.toNamed('/Dashboard');
    controller.data.clear();
    controller.getdata();
  }
}
