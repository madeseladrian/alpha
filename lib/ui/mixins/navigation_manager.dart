import 'package:get/route_manager.dart';

mixin NavigationManager {
  void handleNavigation(Stream<String?> stream) {
    stream.listen((page) {
      if (page != null && page.isNotEmpty) {
        Get.offAllNamed(page);
      }
    });
  }
}