import 'package:bgd_getx/routes/get_views.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late FirebaseMessaging messaging;


  @override
  void onInit() async {
    super.onInit();

    await Firebase.initializeApp();
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('Message clicked!');
    });
    pushNotification();
  }

  void goDetail() {
    print('hihi');
    Get.toNamed(GetViews.HOCPHI_DETAIL_SCREEN);
  }

  Future<void> _messageHandler(RemoteMessage message) async {
    print('background message ${message.notification}');
    Get.toNamed(GetViews.HOCPHI_DETAIL_SCREEN);
  }

  pushNotification(){
    messaging = FirebaseMessaging.instance;

    //Lấy token từ firebase
    messaging.getToken().then((value) {
      print(value);
    });

    // Xử lý thông báo khi firebase trả về
    FirebaseMessaging.onMessage.listen((event) {
      print("message recieved");
      print(event.notification!.body);
      showDialog(context: Get.context!, builder: (BuildContext context){
        return AlertDialog(
          title: Text('Notification'),
          content: Text(event.notification!.body!),
          actions: [
            TextButton(onPressed: () {
              print('OK clicked');
            }, child: Text('OK'),),
          ],
        );
      });
    });

    // FirebaseMessaging.onBackgroundMessage(_messageHandler);
  }
}
