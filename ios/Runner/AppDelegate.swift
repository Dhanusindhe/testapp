import Flutter
import UIKit
import Firebase
import moengage_flutter_ios
import MoEngageSDK

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let sdkConfig = MoEngageSDKConfig(appId: "H0LK4MS1ETIM4ODCRME7R6HE", dataCenter: .data_center_03);
      sdkConfig.consoleLogConfig = MoEngageConsoleLogConfig(isLoggingEnabled: true, loglevel: .verbose)
      MoEngageInitializer.sharedInstance.initializeDefaultInstance(sdkConfig, launchOptions: launchOptions)
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
