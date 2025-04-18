import UserNotifications
import MoEngageRichNotification
class NotificationService: UNNotificationServiceExtension {
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
      MoEngageSDKRichNotification.setAppGroupID("group.com.giottus.testapp.MoEngage")
      self.contentHandler = contentHandler
bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
      MoEngageSDKRichNotification.handle(richNotificationRequest: request, withContentHandler: contentHandler)
    }
override func serviceExtensionTimeWillExpire() {
if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }}}
