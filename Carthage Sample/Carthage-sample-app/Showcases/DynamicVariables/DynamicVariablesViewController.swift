import UIKit
import ContentsquareModule

enum AccountType: Int {
    case standard = 0
    case premium = 1
}

// This class showcases how to use dynamic variables to gather additional data about the session,
// such as which version of an A/B test the user saw, or other relevant user data
class DynamicVariablesViewController: UIViewController {

    @IBOutlet private weak var testButton: UIButton!
    private var testButtonColor = UIColor()
    private var userAge: UInt32 = 0
    private var userAccount: AccountType = .standard

    override func loadView() {
        super.loadView()

        // Get the color for the button from A/B test configuration
        // For instance, yellow or green
        testButtonColor = .yellow
        testButton.backgroundColor = testButtonColor
        // Retrieve the user's age and his account type, from his personal account for instance
        userAge = 24
        userAccount = .premium

        sendDynamicVariables()
    }

    //MARK: - Dynamic vars

    private func sendDynamicVariables() {
        // Are users more likely to tap on a yellow or a green button?
        let colorValue = testButtonColor.isEqual(UIColor.yellow) ? "yellow" : "green"
        Contentsquare.send(dynamicVar: DynamicVar(key: "Button Color", value: colorValue))
        // Also send the user's age and his account type, to determine if it has an impact on the A/B test
        Contentsquare.send(dynamicVar: DynamicVar(key: "User age", value: userAge))
        let accountValue = userAccount == .standard ? "standard" : "premium"
        Contentsquare.send(dynamicVar: DynamicVar(key: "User account", value: accountValue))
    }
}
