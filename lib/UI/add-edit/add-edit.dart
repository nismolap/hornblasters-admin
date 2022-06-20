// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hornblastersadmin/UI/constants.dart';
import 'package:hornblastersadmin/UX/add-edit-controller.dart';

class AddEdit extends StatelessWidget {
  AddEditController controller = Get.put(AddEditController());

  AddEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = new GlobalKey<FormState>();
    void addeditcheck() async {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        formdata.save();
        controller.save();
      }
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        leading: Container(),
        backgroundColor: P3,
      ),
      body: Obx(
        () => Container(
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
                      flex: 22,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 55,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: P5,
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: P3,
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Add New\nPic / Video',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: P5,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 78,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25)),
                            color: P5),
                        child: Row(
                          children: [
                            Expanded(flex: 2, child: Container()),
                            Expanded(
                                flex: 15,
                                child: Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: Text(
                                        'Fill the details to sign',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: P2,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        child: Form(
                                          key: formstate,
                                          child: Column(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(),
                                                        ),
                                                        Expanded(
                                                          flex: 10,
                                                          child: TextFormField(
                                                            initialValue: controller
                                                                        .pagetype
                                                                        .value ==
                                                                    'add'
                                                                ? null
                                                                : '${controller.title.value}',
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            cursorColor: P2,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: P2),
                                                            decoration:
                                                                InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors
                                                                  .white24,
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical:
                                                                          25.0,
                                                                      horizontal:
                                                                          20.0),
                                                              labelText:
                                                                  'Title',
                                                              labelStyle:
                                                                  TextStyle(
                                                                      color: P2,
                                                                      fontSize:
                                                                          18),
                                                              hintStyle:
                                                                  TextStyle(
                                                                      color: P2,
                                                                      fontSize:
                                                                          18),
                                                            ),
                                                            onSaved: (val) {
                                                              controller.title
                                                                  .value = val!;
                                                            },
                                                            onChanged: (val) {
                                                              controller.title
                                                                  .value = val;
                                                            },
                                                            validator: (val) {
                                                              if (val == null ||
                                                                  val.isEmpty) {
                                                                return 'This field is required';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(),
                                                        ),
                                                        Expanded(
                                                          flex: 10,
                                                          child: TextFormField(
                                                            initialValue: controller
                                                                        .pagetype
                                                                        .value ==
                                                                    'add'
                                                                ? null
                                                                : '${controller.url.value}',
                                                            keyboardType:
                                                                TextInputType
                                                                    .visiblePassword,
                                                            cursorColor: P2,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: P2),
                                                            decoration:
                                                                InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors
                                                                  .white24,
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical:
                                                                          25.0,
                                                                      horizontal:
                                                                          20.0),
                                                              labelText: 'Url',
                                                              labelStyle:
                                                                  TextStyle(
                                                                      color: P2,
                                                                      fontSize:
                                                                          18),
                                                              hintStyle:
                                                                  TextStyle(
                                                                      color: P2,
                                                                      fontSize:
                                                                          18),
                                                            ),
                                                            onSaved: (val) {
                                                              controller.url
                                                                  .value = val!;
                                                            },
                                                            onChanged: (val) {
                                                              controller.url
                                                                  .value = val;
                                                            },
                                                            validator: (val) {
                                                              if (val == null ||
                                                                  val.isEmpty) {
                                                                return 'This field is required';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              controller.uri.value == ''
                                                  ? controller.type.value == ''
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            GetBuilder<
                                                                AddEditController>(
                                                              builder:
                                                                  (controller) =>
                                                                      Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  color: Color(
                                                                      0xff42C2FF),
                                                                ),
                                                                child:
                                                                    DropdownButton(
                                                                  underline:
                                                                      Container(),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .arrow_drop_down_outlined,
                                                                    color: Color(
                                                                        0xffEFFFFD),
                                                                    size: 40,
                                                                  ),
                                                                  dropdownColor:
                                                                      Color(
                                                                          0xff42C2FF),
                                                                  hint:
                                                                      Container(
                                                                    width: 120,
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    child: Text(
                                                                      'Choose Type',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          color:
                                                                              Color(0xffEFFFFD)),
                                                                    ),
                                                                  ),
                                                                  items: controller
                                                                      .types
                                                                      .map((e) =>
                                                                          DropdownMenuItem(
                                                                            child:
                                                                                Container(
                                                                              width: 120,
                                                                              alignment: Alignment.centerRight,
                                                                              child: Text(
                                                                                '$e',
                                                                                textAlign: TextAlign.end,
                                                                                style: TextStyle(fontSize: 20, color: Color(0xffEFFFFD)),
                                                                              ),
                                                                            ),
                                                                            value:
                                                                                e,
                                                                          ))
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) {
                                                                    controller
                                                                            .selected =
                                                                        val;
                                                                    controller
                                                                            .type
                                                                            .value =
                                                                        controller
                                                                            .selected;
                                                                    controller
                                                                        .update();
                                                                  },
                                                                  value: controller
                                                                      .selected,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : Container(
                                                          height: 140,
                                                          width: 140,
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              P2)),
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                              if (controller
                                                                      .type
                                                                      .value ==
                                                                  'image') {
                                                                controller
                                                                    .pickImage();
                                                              } else {
                                                                controller
                                                                    .pickVideo();
                                                              }
                                                            },
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    elevation:
                                                                        0.0,
                                                                    primary: Colors
                                                                        .transparent,
                                                                    onPrimary:
                                                                        P2),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Icon(
                                                                  Icons.upload,
                                                                  size: 40,
                                                                  color: P2,
                                                                ),
                                                                Text(
                                                                  'Uploud',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    color: P2,
                                                                    fontSize:
                                                                        18.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                  : Container(
                                                      padding:
                                                          EdgeInsets.all(20),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,
                                                              color: P2)),
                                                      child: Text(
                                                        controller.iname.value,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: P2,
                                                          fontSize: 18.0,
                                                        ),
                                                      ),
                                                    ),

                                              // controller.iname.value == '' ?
                                              //
                                              //
                                              //     controller.type.value == '' ?
                                              // Row(
                                              //   mainAxisAlignment: MainAxisAlignment.center,
                                              //   children: [
                                              //
                                              //     GetBuilder<AddEditController>(
                                              //       builder: (controller)=> Container(
                                              //         padding: EdgeInsets.all(10),
                                              //         decoration: BoxDecoration(
                                              //           borderRadius: BorderRadius.circular(20),
                                              //           color: Color(0xff42C2FF),
                                              //         ),
                                              //         child: DropdownButton(
                                              //           underline: Container(),
                                              //           icon: Icon(Icons.arrow_drop_down_outlined , color: Color(0xffEFFFFD),size: 40,),
                                              //           dropdownColor: Color(0xff42C2FF),
                                              //           hint: Container(
                                              //             width: 120,
                                              //             alignment: Alignment.centerRight,
                                              //             child: Text('Choose Type',textAlign: TextAlign.end,style: TextStyle(
                                              //                 fontSize: 20,
                                              //                 color: Color(0xffEFFFFD)
                                              //             ),),
                                              //           ),
                                              //           items: controller.types.map((e) => DropdownMenuItem(
                                              //             child: Container(
                                              //               width: 120,
                                              //               alignment: Alignment.centerRight,
                                              //               child: Text('$e',textAlign: TextAlign.end,style: TextStyle(
                                              //                   fontSize: 20,
                                              //                   color: Color(0xffEFFFFD)
                                              //               ),),
                                              //             ),
                                              //             value: e,
                                              //           )).toList(),
                                              //           onChanged: (val){
                                              //             controller.selected = val ;
                                              //             controller.type.value = controller.selected ;
                                              //             controller.update();
                                              //           },
                                              //           value: controller.selected,
                                              //         ),
                                              //       ),
                                              //     ),
                                              //
                                              //   ],
                                              // )
                                              //
                                              // :
                                              //
                                              //
                                              //
                                              // Container(
                                              //   height: 140,
                                              //   width: 140,
                                              //   decoration: BoxDecoration(
                                              //     border: Border.all(
                                              //       width: 1,
                                              //       color: P2
                                              //     )
                                              //   ),
                                              //   child: ElevatedButton(
                                              //     onPressed: (){FocusManager.instance.primaryFocus?.unfocus();
                                              //       if(controller.type.value == 'image'){
                                              //         controller.pickImage();
                                              //       } else {
                                              //         controller.pickVideo();
                                              //       }
                                              //
                                              //       },
                                              //     style: ElevatedButton.styleFrom(
                                              //       elevation: 0.0,
                                              //       primary: Colors.transparent,
                                              //       onPrimary: P2
                                              //       ),
                                              //     child: Column(
                                              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              //       children: [
                                              //
                                              //         Icon(Icons.upload,size: 40,color: P2,),
                                              //
                                              //         Text('Uploud',textAlign: TextAlign.left,
                                              //           style: TextStyle(
                                              //             color: P2,
                                              //             fontSize: 18.0,
                                              //           ),),
                                              //
                                              //       ],
                                              //     ),
                                              //   ),
                                              // )
                                              //
                                              //     :
                                              //
                                              // Container(
                                              //   padding: EdgeInsets.all(20),
                                              //   decoration: BoxDecoration(
                                              //       border: Border.all(
                                              //           width: 1,
                                              //           color: P2
                                              //       )
                                              //   ),
                                              //   child: Text(controller.iname.value,textAlign: TextAlign.left,
                                              //     style: TextStyle(
                                              //       color: P2,
                                              //       fontSize: 18.0,
                                              //     ),),
                                              // ),

                                              Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 10, top: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(),
                                                    ),
                                                    Expanded(
                                                      flex: 10,
                                                      child: FlatButton(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        color: P2,
                                                        height: 70,
                                                        onPressed: () {
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                          addeditcheck();
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              child: Text(
                                                                'Save',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  color: P5,
                                                                  fontSize:
                                                                      18.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              controller.pagetype.value ==
                                                      'edit'
                                                  ? Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 50),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(),
                                                          ),
                                                          Expanded(
                                                            flex: 10,
                                                            child: FlatButton(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0)),
                                                              color:
                                                                  Colors.pink,
                                                              height: 70,
                                                              onPressed: () {
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                                controller
                                                                    .delete();
                                                              },
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    child: Text(
                                                                      'Delete',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style:
                                                                          TextStyle(
                                                                        color:
                                                                            P5,
                                                                        fontSize:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Expanded(flex: 2, child: Container()),
                          ],
                        ),
                      )),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
