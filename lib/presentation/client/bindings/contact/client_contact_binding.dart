import 'package:get/get.dart';
import 'package:elegant_advisors/presentation/client/controllers/contact/client_contact_controller.dart';

class ClientContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientContactController>(() => ClientContactController());
  }
}
