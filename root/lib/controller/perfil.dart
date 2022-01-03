import 'package:get/get.dart';

class PerfilController extends GetxController {
  var howIs = 'Residos'.obs;

  void changePage() {
    howIs(howIs.value == 'Residos' ? 'Trocas' : 'Residos');
  }
}
