
import UIKit
import ContentSquare

class DefaultScreenViewController: UIViewController {

    // In most cases, the simplest place to track screen views is in the controller's
    // viewDidAppear.
    //
    // Avoid putting screen views in viewWillAppear. It is advised to avoid puting non critical
    // work in viewWillAppear, since you don't want to use the main thread unnecessarily while
    // a view is in the process of being displayed.
    //
    // Also, avoid using viewDidLoad, since it won't always be called. For instance, it won't
    // be called in cases of back navigation in a navigation stack.
    override func viewDidAppear(_ animated: Bool) {
        // Remember to always call super in a viewDidAppear
        super.viewDidAppear(animated)
        ContentSquare.send(screenViewWithName: "Default screen view demo page")
    }
}
