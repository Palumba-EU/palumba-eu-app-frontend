import 'package:flutter_boilerplate/data/model/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  late User _user;
  User get user => _user;

  @override
  void onInit() {
    super.onInit();
  }

  void setUser(User newUser) {
    _user = newUser;
  }
}
