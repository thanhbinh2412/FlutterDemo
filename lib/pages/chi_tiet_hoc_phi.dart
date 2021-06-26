import 'dart:ui';

import 'package:bgd_getx/commons/color.dart';
import 'package:bgd_getx/controllers/chiTietHocPhiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ChiTietHocPhiScreen extends GetWidget {
  ChiTietHocPhiController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 110.0,
                    decoration: BoxDecoration(
                      color: Color(
                        ColorCode.colorMainTheme,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 16.0,
                          left: 16.0,
                          right: 16.0,
                          bottom: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.infoBank();
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.maps_home_work_outlined,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 4.0,
                                        left: 8.0,
                                      ),
                                      child: Text(
                                        'THÔNG TIN TÀI KHOẢN NGÂN HÀNG',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10.0,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3)),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 8.0,
                              left: 10.0,
                              bottom: 8.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'HỌC PHÍ THÁNG 6/2021',
                                  style: TextStyle(
                                    color: Color(
                                      ColorCode.colorMainText,
                                    ),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text('Học Sinh: Nguyễn Văn A'),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text('Ngày mở đợt thu: 20/06/2021'),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text('Hạn đóng: 28/06/2021'),
                                SizedBox(
                                  height: 8.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nội dung khoản thu',
                          style: TextStyle(
                            color: Color(
                              ColorCode.colorMainText,
                            ),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Chi phí',
                          style: TextStyle(
                            color: Color(
                              ColorCode.colorMainText,
                            ),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    ItemKhoanThu(
                      title: 'Học phí nhà trẻ',
                      soTien: '3.200.000',
                    ),
                    Divider(),
                    ItemKhoanThu(
                      title: 'Tiền Ăn',
                      soTien: '800.000',
                    ),
                    Divider(),
                    ItemKhoanThu(
                      title: 'Tiền ăn sáng',
                      soTien: '600.000',
                    ),
                    Divider(),
                    ItemKhoanThu(
                      title: 'Ăn tối',
                      soTien: '230.000',
                    ),
                    Divider(),
                    ItemKhoanThu(
                      title: 'Học phí',
                      soTien: '3.000.000',
                    ),
                    Divider(),
                    ItemKhoanThu(
                      title: 'Giảm trừ học phí',
                      soTien: '0',
                      styleTitle: TextStyle(
                          color: Color(
                            ColorCode.colorTextError,
                          ),
                          fontStyle: FontStyle.italic,
                          fontSize: 18.0),
                      colorSoTien: Color(ColorCode.colorTextError),
                    ),
                    Divider(),
                    ItemKhoanThu(
                      title: 'TỔNG',
                      soTien: '8.000.000',
                      styleTitle: TextStyle(
                        color: Color(
                          ColorCode.colorMainText,
                        ),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                      colorSoTien: Color(ColorCode.colorMainText),
                    ),
                    ItemKhoanThu(
                      title: 'ĐÃ ĐÓNG',
                      soTien: '0',
                      styleTitle: TextStyle(
                        color: Color(
                          ColorCode.colorMainText,
                        ),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                      colorSoTien: Color(ColorCode.colorMainText),
                    ),
                    ItemKhoanThu(
                      title: 'CÒN PHẢI ĐÓNG',
                      soTien: '8.400.000',
                      styleTitle: TextStyle(
                        color: Color(
                          ColorCode.colorTextError,
                        ),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                      colorSoTien: Color(ColorCode.colorTextError),
                    ),
                    Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemKhoanThu extends StatelessWidget {
  ItemKhoanThu(
      {Key? key,
      required this.title,
      required this.soTien,
      this.styleTitle,
      this.colorSoTien})
      : super(key: key);

  String title = '';
  String soTien = '';
  Callback? onTap;

  TextStyle? styleTitle;
  Color? colorSoTien;
  bool? isShow = true;

  @override
  Widget build(BuildContext context) {
    if (styleTitle == null) {
      styleTitle = TextStyle(
        color: Color(
          ColorCode.colorMainText,
        ),
        fontSize: 18.0,
      );
    }
    if (colorSoTien == null) {
      colorSoTien = Color(ColorCode.colorMainText);
    } else {
      this.isShow = false;
    }
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: styleTitle),
          Row(
            children: [
              Text(
                soTien,
                style: TextStyle(
                  color: colorSoTien,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 8.0,
                  left: 4.0,
                  right: 10.0,
                ),
                child: Text(
                  'VNĐ',
                  style: TextStyle(
                    color: colorSoTien,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              this.isShow == true ? Icon(Icons.navigate_next) : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
