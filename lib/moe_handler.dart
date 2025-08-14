import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moengage_flutter/moengage_flutter.dart';

class MoengageHandler {
  static late MoEngageFlutter _moEngagePlugin;

  static late Map<String, dynamic> moengagageConfig;

  static void onMoengagePushClick(PushCampaignData message) async {
    Map<String, dynamic> payload = message.data.payload;
    String deepLinkPath = "";
    if (Platform.isIOS) {
      deepLinkPath = payload["moengage"]["screenData"]["deeplink"] ?? "";
    } else if (Platform.isAndroid) {
      deepLinkPath = message.data.payload["deeplink"] ?? "";
    }
    if (deepLinkPath.isNotEmpty) {
      print("Deeplink $deepLinkPath");
    }
  }

  // Initialize MoEngage with the workspace ID
  static initialzeMoengage(BuildContext context) async {
    try {
      String workspaceID = "H0LK4MS1ETIM4ODCRME7R6HE";
      _moEngagePlugin = MoEngageFlutter(workspaceID);
      _moEngagePlugin.setPushClickCallbackHandler(onMoengagePushClick);
      _moEngagePlugin.configureLogs(LogLevel.VERBOSE);
      print("On push triggered set");
      _moEngagePlugin.initialise();
    } catch (ex) {
      log(ex.toString());
    }
  }

  // Identify user to MoEngage
  static void setUUID(String uniqueID) {
    _moEngagePlugin.identifyUser(uniqueID);
  }

  // User logout
  static void userLogout() {
    _moEngagePlugin.logout();
  }
}
