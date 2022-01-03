import 'package:get/get.dart';
import 'package:root/model/user.dart';
import 'package:root/service/service.dart';

class UserController extends GetxController {
  User user = User();

  @override
  void onInit() {
    super.onInit();
    Service.getUsers();
  }

  UserController({this.user});
}
