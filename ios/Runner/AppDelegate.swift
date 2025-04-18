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
      sdkConfig.appGroupID = "group.com.giottus.testapp.MoEngage"
      MoEngageInitializer.sharedInstance.initializeDefaultInstance(sdkConfig, launchOptions: launchOptions)
      FirebaseApp.configure()
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
      MoEngageSDKMessaging.sharedInstance.setPushToken(deviceToken)
    }
    override func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
      if #available(iOS 14.0, *) {
        completionHandler([.sound,.alert, .banner, .list])
      } else {
        completionHandler([.sound,.alert])
      }
    }
        
    override func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
      super.userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
      MoEngageSDKMessaging.sharedInstance.userNotificationCenter(center, didReceive: response)
    }
}



