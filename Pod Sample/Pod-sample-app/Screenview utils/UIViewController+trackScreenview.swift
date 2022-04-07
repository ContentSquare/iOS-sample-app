
import UIKit
import ContentsquareModule

// We use this convenience extension to send screen views in view controllers.
extension UIViewController {
    func trackScreenview(_ screenName: String) {
        Contentsquare.send(screenViewWithName: screenName)
    }
}
