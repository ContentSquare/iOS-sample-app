
import UIKit

// Use this custom class for view controllers in your storyboard, and they will start sending screen views. They
// will still be editable in the storyboard as usual. You can use the same approach for any cotroller which you edit in
// a storyboard and for which you don't have code.
class TrackedViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        trackScreenview(title ?? "Unknown screen title")
    }
}

// In the same way, use this custom class for table view controllers in your storyboard, and they will start sending
// screen views. Again, they will still be editable in the storyboard as usual table view controllers.
class TrackedTableViewController: UITableViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        trackScreenview(title ?? "Unknown screen title")
    }
}
