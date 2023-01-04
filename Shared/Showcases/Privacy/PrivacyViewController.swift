import UIKit
import ContentsquareModule

// This class showcases how to use privacy-related APIs. You are responsible for creating the UI asking the user for his consent, and then calling the appropriate Contentsquare function.
class PrivacyViewController: UIViewController {

    @IBOutlet private weak var commandTitle: UILabel!
    @IBOutlet private weak var commandMessage: UILabel!

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)

        commandTitle.text = ""
        commandMessage.text = ""
    }

    //MARK: - UI Actions

    @IBAction private func optOutButtonTapped(_ sender: UIButton)
    {
        Contentsquare.optOut()
        displayCommand(title: "User opted out", message: "The user is no longer being tracked. The User ID has been deleted, and no more data will be collected.")
    }
    
    @IBAction private func optInButtonTapped(_ sender: UIButton)
    {
        Contentsquare.optIn()
        displayCommand(title: "User opted in", message: "The user is now being tracked, and a new User ID has been generated.")
    }

    @IBAction private func stopButtonTapped(_ sender: UIButton)
    {
        Contentsquare.stopTracking()
        displayCommand(title: "Tracking stopped", message: "The tracking is stopped until next app launch, or until a call to resumeTracking()")
    }
    
    @IBAction private func resumeButtonTapped(_ sender: UIButton)
    {
        Contentsquare.resumeTracking()
        displayCommand(title: "Tracking resumed", message: "The tracking is back!")
    }
    
    @IBAction private func forgetButtonTapped(_ sender: UIButton)
    {
        Contentsquare.forgetMe()
        displayCommand(title: "Forget User", message: "The User ID has been deleted, and all the collected data has been erased from the device.\n If the user is opted in, tracking will start at next app launch with a new User ID.")
    }

    @IBAction private func IDButtonTapped(_ sender: UIButton)
    {
        let id = Contentsquare.userID
        displayCommand(title: "User ID", message: "The User ID is \(id ?? "undefined.")")
    }

    //MARK: - Private

    private func displayCommand(title: String?, message: String?)
    {
        commandTitle.text = title
        commandMessage.text = message
    }
}
