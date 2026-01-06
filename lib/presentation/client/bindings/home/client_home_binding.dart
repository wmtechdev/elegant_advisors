import 'package:get/get.dart';
import 'package:elegant_advisors/presentation/client/controllers/home/client_home_controller.dart';

class ClientHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientHomeController>(() => ClientHomeController());
  }
}
