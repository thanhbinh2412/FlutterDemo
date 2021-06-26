import 'package:bgd_getx/commons/color.dart';
import 'package:bgd_getx/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget {
  double width = MediaQuery.of(Get.context!).size.width;
  double height = MediaQuery.of(Get.context!).size.height;

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180.0,
                  decoration: BoxDecoration(
                    color: Color(ColorCode.colorMainTheme),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 180.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Colors.white,
                          ),
                          child: Text('hihi'),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Container(
                          width: 180.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 380.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Divider(),
            SizedBox(
              height: 8.0,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.goDetail();
                    },
                    child: Container(
                      width: 380.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(
                            ColorCode.colorBorder,
                          ),
                        ),
                        color: Color(ColorCode.colorItem),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'HỌC PHÍ THÁNG 6/2021',
                              style: TextStyle(
                                  color: Color(ColorCode.colorMainText),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Hạn đóng 10/06/2021',
                              style: TextStyle(
                                color: Color(ColorCode.colorMainText),
                                fontSize: 12.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '0',
                                        style: TextStyle(
                                          color:
                                              Color(ColorCode.colorMainTheme),
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 4.0,
                                          bottom: 16.0,
                                        ),
                                        child: Text(
                                          'vnđ',
                                          style: TextStyle(
                                            color:
                                                Color(ColorCode.colorMainTheme),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '10.000.000',
                                        style: TextStyle(
                                          color:
                                              Color(ColorCode.colorTextError),
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 4.0,
                                          bottom: 16.0,
                                        ),
                                        child: Text(
                                          'vnđ',
                                          style: TextStyle(
                                            color:
                                                Color(ColorCode.colorTextError),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 8.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ĐÃ ĐÓNG',
                                    style: TextStyle(
                                      color: Color(
                                        ColorCode.colorMainTheme,
                                      ),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'CHƯA ĐÓNG',
                                    style: TextStyle(
                                      color: Color(
                                        ColorCode.colorTextError,
                                      ),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                    ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
