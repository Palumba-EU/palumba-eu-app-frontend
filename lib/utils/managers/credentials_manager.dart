import 'dart:core';

import 'package:flutter_boilerplate/main.dart';

class CredentialsManager {
  static final bool useLocal = false;
  static final bool useDev = false;
  static final String kGoogleApiKey = "";
  static final String packageVersionApiKey = "";

  static var gqlServerKeyURL = "";
  static var _gqlServerDevUrl = "";
  static var _gqlServerProdUrl = "";
  static var _gqlServerLocalUrl = "";

  static var _gqlSocketDevUrl = "";
  static var _gqlSocketProdUrl = "";
  static var _gqlSocketLocalUrl = "";

  static var _devXApiKey = "";
  static var _prodXApiKey = "";
  static var _localXApiKey = "";

  static String getKeysURL() {
    return gqlServerKeyURL;
  }

  static bool isDev() {
    if (EnvironmentConfig.environment == "dev" || useDev) {
      return true;
    }
    return false;
  }
  static String getServerURL() {
    if (useLocal) {
      return _gqlServerLocalUrl;
    }
    if (EnvironmentConfig.environment == "dev" || useDev) {
      return _gqlServerDevUrl;
    }
    return _gqlServerProdUrl;
  }
  static String getSocketServerURL() {
    if (useLocal) {
      return _gqlSocketLocalUrl;
    }
    if (EnvironmentConfig.environment == "dev" || useDev) {
      return _gqlSocketDevUrl;
    }
    return _gqlSocketProdUrl;
  }

  static String getAPIKey() {
    if (useLocal) {
      return _localXApiKey;
    }
    if (EnvironmentConfig.environment == "dev" || useDev) {
      return _devXApiKey;
    }
    return _prodXApiKey;
  }

  static Map<String, String>? getHeaders() {
    return {};
  }
}
