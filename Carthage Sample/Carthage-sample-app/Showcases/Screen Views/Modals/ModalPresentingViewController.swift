
import UIKit

// This class presents a modal designed in the storyboard. The modal is presented with a segue also implemented in the
// storyboard.
//
// We need to trigger screen views at three different moments:
// - when this ViewController appears on screen
// - when the modal appears on screen
// - when this ViewController re-appears on screen after closing the modal
//
// The first is easy: we just send a screen view in this presenter's viewDidAppear. The second is easy too: we switched,
// in the storyboard, the custom class of the modal to a class that also sends screen views in its viewDidAppear.
//
// The third is the real challenge here. When the modal is dismissed, we need to find a way to notify the presenter so
// that it can send a screen view. But we want to do this without adding code to the modal, which we still want to be as
// much as possible a storyboard modal. We achieved this by adding an unwind segue between the modal's cancel button and
// this presenter in the storyboard, and then implementing unwindFromSegue here.
class ModalPresentingViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
    private let screenName = "Storyboard modal presenter"
    
    // The usual screen view for when this controller first appears.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        trackScreenview(screenName)
    }
    
    @IBAction private func unwindFromSegue(segue: UIStoryboardSegue) {
        trackScreenview(screenName)
    }
    
    // In iOS 13, modals can be dismissed by swiping down. In such case, unwindFromSegue won't be triggered. Instead,
    // this new method of UIAdaptivePresentationControllerDelegate will be triggered.
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
