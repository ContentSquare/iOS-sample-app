
import UIKit
import ContentSquare

class ProgrammaticModalViewController: UIViewController, Dismissable {
    var dismissalDelegate: DismissalDelegate?
    
    override func loadView() {
        super.loadView()
        
        if #available(iOS 13, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        let dismissButton = UIButton()
        dismissButton.setTitleColor(.systemBlue, for: .normal)
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        view.addSubview(dismissButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc func dismissSelf(sender: UIButton!) {
        dismissalDelegate?.dismiss(self)
    }
    
    // Send a screen view when the view appears.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ContentSquare.send(screenViewWithName: "Programmatic modal")
    }
}
