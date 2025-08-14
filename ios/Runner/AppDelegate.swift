import Firebase
import Flutter
import MoEngageSDK
import UIKit
import UserNotifications
import moengage_flutter_ios

@main
@objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication
            .LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
                // Use it here for MoEngage SDK init
                let sdkConfig = MoEngageSDKConfig(
            appId: "H0LK4MS1ETIM4ODCRME7R6HE", dataCenter: .data_center_03)
        sdkConfig.consoleLogConfig = MoEngageConsoleLogConfig(
            isLoggingEnabled: true, loglevel: .verbose)
            sdkConfig.updateConfigForTestEnvironment()
                sdkConfig.appGroupID = "group.com.giottus.app.MoEngage"
                MoEngageInitializer.sharedInstance.initializeDefaultInstance(
                    sdkConfig, launchOptions: launchOptions)
                
            
        
        GeneratedPluginRegistrant.register(with: self)
        
                if #available(iOS 10.0, *) {
                    // For iOS 10 display notification (sent via APNS)
                    UNUserNotificationCenter.current().delegate = self
                    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                    UNUserNotificationCenter.current().requestAuthorization(
                        options: authOptions,
                        completionHandler: { _, _ in })
                } else {
                    let settings: UIUserNotificationSettings =
                        UIUserNotificationSettings(
                            types: [.alert, .badge, .sound], categories: nil)
                    application.registerUserNotificationSettings(settings)
                }
                application.registerForRemoteNotifications()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    override func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        super.application(
            application,
            didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        MoEngageSDKMessaging.sharedInstance.setPushToken(deviceToken)
    }
    override func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (
            UNNotificationPresentationOptions
        ) -> Void
    ) {
        if #available(iOS 14.0, *) {
            completionHandler([.sound,.alert, .banner, .list])
        } else {
            completionHandler([.sound,.alert])
        }
    }

    override func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        super.userNotificationCenter(
            center, didReceive: response,
            withCompletionHandler: completionHandler)
        MoEngageSDKMessaging.sharedInstance.userNotificationCenter(
            center, didReceive: response)
    }
}
