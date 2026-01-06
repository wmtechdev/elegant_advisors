import 'package:get/get.dart';
import 'package:elegant_advisors/presentation/client/controllers/properties/client_properties_controller.dart';

class ClientPropertiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientPropertiesController>(() => ClientPropertiesController());
  }
}
