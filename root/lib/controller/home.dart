import 'package:get/get.dart';

class HomeController extends GetxController {
  var whoIs = 'Dashboard'.obs;

  changePage() {
    whoIs( whoIs.value == 'Dashboard' ? 'Users' : 'Dashboard');
  }
}
