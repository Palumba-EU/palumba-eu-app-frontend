import 'package:palumba_eu/data/provider/remote/authentication_api.dart';
import 'package:get/get.dart';

class AuthenticationRepository {
  final AuthenticationAPI _api = Get.find<AuthenticationAPI>();

  Future<String?>? signUp() =>
      _api.signUp();
}
