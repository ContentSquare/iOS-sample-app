
import UIKit

protocol DismissalDelegate: UIViewController {
    func didDismiss(viewController: UIViewController)
}

extension DismissalDelegate {
    func dismiss(_ viewController: UIViewController) {
        dismiss(animated: true)
        didDismiss(viewController: viewController)
    }
    
    func didDismiss(viewController: UIViewController) {
        // The default implementation does nothing
    }
}

protocol Dismissable: UIViewController {
    var dismissalDelegate: DismissalDelegate? { get set }
}
