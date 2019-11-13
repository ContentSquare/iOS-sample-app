
import UIKit

class DefaultScreenViewController: UIViewController {

    // The right place to track screen views is in a controller's viewDidAppear.
    //
    // Don't put screen views in viewWillAppear. You should not put non critical work in viewWillAppear, since you don't
    // want to use the main thread unnecessarily while a view is in the process of being displayed.
    //
    // Also, don't use viewDidLoad, since it won't always be called. For instance, it won't be called in cases of back
    // navigation in a navigation stack.
    override func viewDidAppear(_ animated: Bool) {
        // Remember to always call super in a viewDidAppear
        super.viewDidAppear(animated)
        trackScreenview("Default screen view demo page")
    }
}
