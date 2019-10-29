import UIKit
import ContentSquare

// Use this custom class for table view controllers in your storyboard, and they will start sending screen views. They
// will still be editable in the storyboard as usual. You can use the same approach for any cotroller which you edit in
// a storyboard and for which you don't have code.
class TrackedTableViewController: UITableViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sendScreenview()
    }
}

extension UIViewController {
    func sendScreenview() {
        ContentSquare.send(screenViewWithName: title ?? "Unknow screen title")
    }
}
