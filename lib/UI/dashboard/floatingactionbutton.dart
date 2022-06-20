import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hornblastersadmin/UI/constants.dart';
import 'package:hornblastersadmin/UX/add-edit-controller.dart';

class FloatingActionButtonD extends StatelessWidget {
  AddEditController add = Get.put(AddEditController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      child: FloatingActionButton(

        onPressed: () {
          add.pagetype.value = 'add' ;
          Get.toNamed('AddEdit');
          add.title.value = '';
          add.url.value = '';
          add.uri.value = '';
          add.type.value = '';
          add.iname.value = '';
          add.selected = null;





        },
        backgroundColor: P5,
        child: Icon(Icons.add,color: P2,size: 50,),
      ),
    );
  }
}
