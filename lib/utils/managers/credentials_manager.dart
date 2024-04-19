import 'dart:core';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CredentialsManager {
  static String getKeysURL() {
    return dotenv.get("AUTHENTICATION_KEY_URL");
  }

  static bool isDev() {
    return dotenv.get("ENV") == "dev";
  }

  static String getServerURL() {
    return dotenv.get("SERVER");
  }

  static String getSocketServerURL() {
    return dotenv.get("SOCKET_SERVER");
  }

  static String getAPIKey() {
    return dotenv.get("API_KEY");
  }
}
