import 'package:get/get.dart';
import '../../controllers/dashboard/admin_dashboard_controller.dart';

class AdminDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDashboardController>(() => AdminDashboardController());
  }
}
