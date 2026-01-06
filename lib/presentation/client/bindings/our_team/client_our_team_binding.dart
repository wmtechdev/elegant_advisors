import 'package:get/get.dart';
import 'package:elegant_advisors/presentation/client/controllers/our_team/client_our_team_controller.dart';

class ClientOurTeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientOurTeamController>(() => ClientOurTeamController());
  }
}
