import 'package:bgd_getx/controllers/chiTietHocPhiController.dart';
import 'package:get/get.dart';

class ChiTietHocPhiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChiTietHocPhiController>(
      () => ChiTietHocPhiController(),
    );
  }
}
