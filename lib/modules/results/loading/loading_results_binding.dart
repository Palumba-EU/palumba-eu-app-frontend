import 'package:get/get.dart';
import 'package:palumba_eu/modules/results/loading/loading_results_controller.dart';

class LoadingResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoadingResultsController());
  }
}
