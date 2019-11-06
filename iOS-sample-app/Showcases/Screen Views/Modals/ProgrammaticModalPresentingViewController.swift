
import UIKit
import ContentSquare

// This class presents a modal programmatically. The modal is implemented in ProgrammaticModalViewController.
//
// We need to implement three screen views here:
// - A screen view for this modal presenter when it appears on screen
// - A screen view for the modal when it is presented on screen
// - A screen view for this modal presenter when the modal is dismissed and this presenter is displayed again
//
// The first two are easy: we just send a screen view in the viewDidAppear of both the presenter and the modal. The
// third is the real challenge here. When the modal is dismissed, we need to find a way to notify the presenter so that
// it can send a screen view. We achieved this with a delegation pattern which is implemented with Dismissable and
// DismissalDelegate. The mechanism can be reused with any pair of modal / modal presenter.
//
// Note: If you use the fullScreen modal presentation style, you don't need to implement this delegation pattern.
// Indeed, with that presentation style, the presenter is removed from the view stack when the modal is presented. When
// the modal closes, the presenter is created again, triggering its viewDidAppear. Thus, to implement all three screen
// views listed above, you just need to send a screen view in the presenter's and the modal's viewDidAppear.
class ProgrammaticModalPresentingViewController:
UIViewController, DismissalDelegate, UIAdaptivePresentationControllerDelegate {
    // The usual screen view for when this controller first appears.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sendScreenview()
    }
    
    @IBAction func presentModal(_ sender: UIButton) {
        let modal = ProgrammaticModalViewController()
        modal.dismissalDelegate = self
        modal.presentationController?.delegate = self
        present(modal, animated: true)
    }
    
    func didDismiss(viewController: UIViewController) {
        sendScreenview()
    }
    
    // In iOS 13, modals can be dismissed by swiping down. In such case, no method tied to a button will be triggered.
    // Instead, this new method of UIAdaptivePresentationControllerDelegate will be triggered.
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        sendScreenview()
    }
    
    private func sendScreenview() {
        ContentSquare.send(screenViewWithName: "Programmatic modal presenter")
    }
}
