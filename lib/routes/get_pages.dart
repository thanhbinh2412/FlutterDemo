import 'package:bgd_getx/bindings/chiTietHocPhiBinding.dart';
import 'package:bgd_getx/bindings/login_binding.dart';
import 'package:bgd_getx/pages/chi_tiet_hoc_phi.dart';
import 'package:bgd_getx/pages/login_screen.dart';
import 'package:bgd_getx/routes/get_views.dart';
import 'package:get/get.dart';

class GetPages {
  static final getPage = [
    GetPage(
      name: GetViews.LOGIN_SCREEN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.leftToRight
    ),
    GetPage(
      name: GetViews.HOCPHI_DETAIL_SCREEN,
      page: () => ChiTietHocPhiScreen(),
      binding: ChiTietHocPhiBinding(),
      transition: Transition.leftToRight
    )
  ];
}
