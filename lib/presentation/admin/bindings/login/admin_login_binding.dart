import 'package:get/get.dart';
import '../../controllers/login/admin_login_controller.dart';

class AdminLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminLoginController>(() => AdminLoginController());
  }
}
