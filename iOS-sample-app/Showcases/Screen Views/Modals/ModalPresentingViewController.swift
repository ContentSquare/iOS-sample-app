
import UIKit
import ContentSquare

// This class has a segue to a modal controller implemented in the storyboard. This showcases how to track screen views
// when coming back from the modal.
class ModalPresentingViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
    private let screenName = "Storyboard modal presenter"
    
    // The usual screen view for when this controller first appears.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        trackScreenview(screenName)
    }
    
    // The modal view has a cancel button which is tied to this unwindFromSegue method.
    @IBAction func unwindFromSegue(segue: UIStoryboardSegue) {
        trackScreenview(screenName)
    }
    
    // In iOS 13, modals can be dismissed by swiping down. In such case, no method tied to a button will be triggered.
    // Instead, this new method of UIAdaptivePresentationControllerDelegate will be triggered.
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        trackScreenview(screenName)
    }
    
    // We have to set ourselves as the presentation controller's delegate so that the above
    // presentationControllerDidDismiss method can be triggered.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as? UINavigationController
        navigationController?.presentationController?.delegate = self
    }
}
