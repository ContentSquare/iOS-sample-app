import UIKit
import ContentSquare

// This class showcases how to use privacy-related APIs
class PrivacyViewController: UIViewController {

    private let commandTitle: UILabel = UILabel()
    private let commandMessage: UILabel = UILabel()

    override func loadView()
    {
        super.loadView()

        let optoutButton = self.buttonWithTitle(title: "Opt Out User")
        optoutButton.addTarget(self, action: #selector(didTapOptOutButton), for: .touchUpInside)
        let optinButton = self.buttonWithTitle(title: "Opt In User")
        optinButton.addTarget(self, action: #selector(didTapOptInButton), for: .touchUpInside)
        let stopButton = self.buttonWithTitle(title: "Stop Tracking User")
        stopButton.addTarget(self, action: #selector(didTapStopButton), for: .touchUpInside)
        let resumeButton = self.buttonWithTitle(title: "Resume Tracking User")
        resumeButton.addTarget(self, action: #selector(didTapResumeButton), for: .touchUpInside)
        let forgetButton = self.buttonWithTitle(title: "Forget User")
        forgetButton.addTarget(self, action: #selector(didTapForgetButton), for: .touchUpInside)
        let userIDButton = self.buttonWithTitle(title: "Display User ID")
        userIDButton.addTarget(self, action: #selector(didTapIDButton), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [optoutButton, optinButton, stopButton, resumeButton, forgetButton, userIDButton])
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.distribution = .equalCentering
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        commandTitle.textAlignment = .center
        commandTitle.textColor = .blue
        self.view.addSubview(commandTitle)
        commandTitle.translatesAutoresizingMaskIntoConstraints = false
        commandTitle.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40).isActive = true
        commandTitle.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true

        commandMessage.textAlignment = .center
        commandMessage.textColor = .purple
        commandMessage.numberOfLines = 0
        self.view.addSubview(commandMessage)
        commandMessage.translatesAutoresizingMaskIntoConstraints = false
        commandMessage.topAnchor.constraint(equalTo: commandTitle.bottomAnchor, constant: 10).isActive = true
        commandMessage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        commandMessage.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
    }

    //MARK: - UI Actions

    @objc
    private func didTapOptOutButton()
    {
        ContentSquare.optOut()
        self.displayCommand(title: "User opted out", message: "The user is no longer being tracked. The User ID has been deleted, and no more data will be collected.")
    }

    @objc
    private func didTapOptInButton()
    {
        ContentSquare.optIn()
        self.displayCommand(title: "User opted in", message: "The user is now being tracked, and a new User ID has been generated.")
    }

    @objc
    private func didTapStopButton()
    {
        ContentSquare.stopTracking()
        self.displayCommand(title: "Tracking stopped", message: "The tracking is stopped until next app launch, or until a call to resumeTracking()")
    }

    @objc
    private func didTapResumeButton()
    {
        ContentSquare.resumeTracking()
        self.displayCommand(title: "Tracking resumed", message: "The tracking is back!")
    }

    @objc
    private func didTapForgetButton()
    {
        ContentSquare.forgetMe()
        self.displayCommand(title: "Forget User", message: "The User ID has been deleted, alike all the collected data has been erased from the device.\n If the user is opted in, tracking will start at next app launch with a new User ID.")
    }

    @objc
    private func didTapIDButton()
    {
        ContentSquare.forgetMe()
        let id = ContentSquare.userID
        self.displayCommand(title: "User ID", message: "The User ID is \(id ?? "undefined.")")
    }

    //MARK: - Private

    private func buttonWithTitle(title: String?) -> UIButton
    {
        let myButton = UIButton(type: .custom)
        myButton.backgroundColor = .lightGray
        myButton.setTitle(title, for: .normal)
        myButton.setTitleColor(.black, for: .normal)
        return myButton
    }

    private func displayCommand(title: String?, message: String?)
    {
        commandTitle.text = title
        commandMessage.text = message
    }
}
