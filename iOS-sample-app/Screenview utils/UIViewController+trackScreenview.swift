
import UIKit
import ContentSquare

// We use this convenience extension to send screen views in view controllers.
extension UIViewController {
    func trackScreenview(_ screenName: String) {
        ContentSquare.send(screenViewWithName: screenName)
    }
}
