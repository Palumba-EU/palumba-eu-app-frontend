import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../data/provider/local/local_auth.dart';
import '../data/provider/remote/authentication_api.dart';
import '../data/provider/remote/user_api.dart';
import '../data/repositories/local/local_auth_repository.dart';
import '../data/repositories/remote/authentication_repository.dart';
import '../data/repositories/remote/user_repository.dart';
import '../global_controllers/user_controller.dart';

class DependencyInjection {
  static void init() {

    // packages
    Get.put<FlutterSecureStorage>(const FlutterSecureStorage());

    //Controllers
    Get.put<UserController>(UserController());

    //Auth
    Get.put<LocalAuth>(LocalAuth());
    Get.put<LocalAuthRepository>(LocalAuthRepository());
    Get.put<AuthenticationAPI>(AuthenticationAPI());
    Get.put<AuthenticationRepository>(AuthenticationRepository());

    //User
    Get.put<UserAPI>(UserAPI());
    Get.put<UserRepository>(UserRepository());
  }
}
