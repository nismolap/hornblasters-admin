import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hornblastersadmin/UI/constants.dart';
import 'package:hornblastersadmin/UX/signin-controller.dart';

class SignIn extends StatelessWidget {
  SignInController controller = Get.put(SignInController());
  SignIn({Key? key}) : super(key: key);

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
                    
                    Expanded(flex:36,child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Hi there,\nWelcome back',textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: P5,
                                fontSize: 25.0,
                              ),),
                          ],
                        ),
                      ),
                    )),

                    Expanded(flex:64,child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                        color: P5
                      ),
                      child: Row(
                        children: [
                          Expanded(flex: 2, child: Container()),
                          Expanded(
                              flex: 15,
                              child: Column(
                                children: [

                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    child: Text('Fill the details to sign',textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: P2,
                                        fontSize: 18.0,
                                      ),),
                                  ),


                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: Form(
                                        key: controller.formstate,
                                        child: Column(
                                          children: [

                                            Column(
                                              children: [

                                                Container(
                                                  margin: EdgeInsets.symmetric(vertical: 10),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(),
                                                      ),
                                                      Expanded(
                                                        flex: 10,
                                                        child: TextFormField(
                                                          keyboardType: TextInputType.text,
                                                          cursorColor: P2,
                                                          style: TextStyle(
                                                              fontSize: 18, color: P2),
                                                          decoration: InputDecoration(
                                                            filled: true,
                                                            fillColor: Colors.white24,
                                                            border: OutlineInputBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(10),
                                                            ),
                                                            contentPadding: EdgeInsets.symmetric(
                                                                vertical: 25.0, horizontal: 20.0),
                                                            labelText: 'Username',
                                                            labelStyle: TextStyle(
                                                                color: P2,
                                                                fontSize: 18),
                                                            hintStyle: TextStyle(
                                                                color: P2,
                                                                fontSize: 18),
                                                          ),
                                                          onSaved: (val) {
                                                          },
                                                          validator: (val) {
                                                            if (val == null || val.isEmpty) {
                                                              return 'This field is required';
                                                            }
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
                                                  margin: EdgeInsets.symmetric(vertical: 10),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(),
                                                      ),
                                                      Expanded(
                                                        flex: 10,
                                                        child: TextFormField(
                                                          keyboardType: TextInputType.visiblePassword,
                                                          cursorColor: P2,
                                                          style: TextStyle(
                                                              fontSize: 18, color: P2),
                                                          decoration: InputDecoration(
                                                            filled: true,
                                                            fillColor: Colors.white24,
                                                            border: OutlineInputBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(10),
                                                            ),
                                                            contentPadding: EdgeInsets.symmetric(
                                                                vertical: 25.0, horizontal: 20.0),
                                                            labelText: 'Password',
                                                            labelStyle: TextStyle(
                                                                color: P2,
                                                                fontSize: 18),
                                                            hintStyle: TextStyle(
                                                                color: P2,
                                                                fontSize: 18),
                                                          ),
                                                          onSaved: (val) {
                                                          },
                                                          validator: (val) {
                                                            if (val == null || val.isEmpty) {
                                                              return 'This field is required';
                                                            }
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


                                            Container(
                                              margin: EdgeInsets.only(bottom: 50, top: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
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
                                                          BorderRadius.circular(10.0)),
                                                      color: P2,
                                                      height: 70,
                                                      onPressed: () {
                                                        controller.signin();
                                                      },
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              'Login',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                color: P5,
                                                                fontSize: 18.0,
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
    );
  }
}