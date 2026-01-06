import 'package:get/get.dart';
import 'package:elegant_advisors/presentation/client/controllers/about_us/client_about_us_controller.dart';

class ClientAboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientAboutUsController>(() => ClientAboutUsController());
  }
}
