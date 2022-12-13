
import UIKit

class DefaultScreenViewController: UIViewController {

    // The right place to track screen views is in a controller's viewWillAppear.
    //
    // Also, don't use viewDidLoad, since it won't always be called. For instance, it won't be called in cases of back
    // navigation in a navigation stack.
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        trackScreenview("Default screen view demo page")
    }
}
