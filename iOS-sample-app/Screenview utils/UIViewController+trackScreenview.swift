
import UIKit
import ContentSquare

extension UIViewController {
    func trackScreenview(_ screenName: String) {
        ContentSquare.send(screenViewWithName: screenName)
    }
}
