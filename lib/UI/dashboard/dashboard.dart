import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hornblastersadmin/UI/constants.dart';
import 'package:hornblastersadmin/UI/dashboard/floatingactionbutton.dart';
import 'package:hornblastersadmin/UX/add-edit-controller.dart';
import 'package:hornblastersadmin/UX/dashboard-controller.dart';

class Dashboard extends StatelessWidget {
  DashboardController controller = Get.put(DashboardController());
  AddEditController add = Get.put(AddEditController());
  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        leading: Container(),
        backgroundColor: P3,
      ),
      body: Obx ( () => Container(
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
            Container(
              height: 20,
            ),
            Expanded(
                child: Column(
                  children: [
                    controller.data.value.length == 0 ? Container(height : 50 , width : 50 ,child: CircularProgressIndicator()) : Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: (70 / 100),
                        children: List.generate(controller.data.value.length, (i) {
                          return

                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Stack(
                                children: [

                                  Column(
                                    children: [
                                      Expanded(flex: 65,child: Container()),
                                      Expanded(
                                        flex: 35,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                            color: P2,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.5),
                                                spreadRadius: 0,
                                                blurRadius: 10,
                                                offset: const Offset(
                                                    0, 6), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Wrap(
                                                children:[ Text('${controller.data.value[i]['title']}',textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: P5,
                                                    fontSize: 18.0,
                                                  ),
                                                ),]
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Expanded(
                                        flex: 70,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              image: DecorationImage(
                                                image: NetworkImage(controller.data[i]['type'] == 'image' ? controller.data[i]['uri'] : 'http://www.milhouses.com.eg/dar/imgs/video.jpg'),
                                                fit: BoxFit.cover,
                                              ),
                                              color: P5
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () async{
                                                  add.pagetype.value = 'edit' ;
                                                  Get.toNamed('AddEdit');
                                                  add.title.value = controller.data[i]['title'];
                                                  add.url.value = controller.data[i]['url'];
                                                  add.uri.value = controller.data[i]['uri'];
                                                  add.type.value = controller.data[i]['type'];
                                                  add.id = controller.data[i]['id'];
                                                  add.iname.value = controller.data[i]['iname'];
                                                },
                                                padding: EdgeInsets.zero,
                                                icon: Icon(Icons.edit,color: P2,size: 55,),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(flex: 30,child: Container())
                                    ],
                                  ),
                                ],
                              ),
                            );






                        }),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButtonD(),
    );
  }
}