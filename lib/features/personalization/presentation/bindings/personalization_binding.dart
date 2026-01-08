import 'package:get/get.dart';
import 'package:samatea/features/personalization/presentation/controllers/personalization_controller.dart';

class PersonalizationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalizationController>(() => PersonalizationController());
  }
}
