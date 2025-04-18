import UIKit
import UserNotifications
import UserNotificationsUI
import MoEngageRichNotification
class NotificationViewController: UIViewController, UNNotificationContentExtension {
    @IBOutlet var label: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        MoEngageSDKRichNotification.setAppGroupID("group.com.giottus.testapp.MoEngage")
    }
func didReceive(_ notification: UNNotification) {
        if #available(iOSApplicationExtension 12.0, *) {
            MoEngageSDKRichNotification.addPushTemplate(toController: self, withNotification: notification)
        } else {
            // Fallback on earlier versions
        }
    }
}
