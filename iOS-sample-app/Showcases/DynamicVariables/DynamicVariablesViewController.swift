import UIKit
import ContentSquare

// This class showcases how to use dynamic variables to gather additional data about the session,
// such as which version of an A/B test the user saw, or other relevant user data
class DynamicVariablesViewController: UIViewController {

    @IBOutlet private weak var buyButton: UIButton!
    private var currentButtonColor: UIColor = .yellow
    private var userAge: Int = 0

    override func loadView()
    {
        super.loadView()

        // Set the color for the button we want to test
        buyButton.backgroundColor = currentButtonColor
        // Retrieve the user age, from his personal account for instance
        userAge = 24

        self.updateDynamicVariables()
    }

    // MARK: - UI Actions

    @IBAction private func colorSwitchChanged(_ sender: UISwitch)
    {
        // Update button color to perform A/B testing
        buyButton.backgroundColor = currentButtonColor.isEqual(UIColor.yellow) ? UIColor.green : UIColor.yellow
        currentButtonColor = buyButton.backgroundColor!

        self.updateDynamicVariables()
    }

    // MARK: - Dynamic vars

    private func updateDynamicVariables()
    {
        // Do users boy more stuff with a yellow or green button?
        let colorValue = currentButtonColor.isEqual(UIColor.yellow) ? "yellow" : "green"
        self.sendStringDynamicVariable(key: "Button Color", value: colorValue)
        // Also send the user's age, to determine if it has an impact on the A/B test
        self.sendIntDynamicVariable(key: "User age", value: userAge)
    }

    private func sendStringDynamicVariable(key: String, value: String)
    {
        do {
            let dynamic = try DynamicVar(key: key, value: value)
            ContentSquare.send(dynamicVar: dynamic)
        }
        catch {
            self.sendLog(message: "Could not create Contentsquare String DynamicVar: \(error)")
        }
    }

    private func sendIntDynamicVariable(key: String, value: Int)
    {
        do {
            let dynamic = try DynamicVar(key: key, value: value)
            ContentSquare.send(dynamicVar: dynamic)
        }
        catch {
            self.sendLog(message: "Could not create Contentsquare Int DynamicVar: \(error)")
        }
    }

    //MARK: - Error handling

    private func sendLog(message: String)
    {
        // The DynamicVar constructor can throw errors if it considers your key or value invalid.
        // Take a look at its Xcode documentation to know what is an invalid key or value. If you are sure your values are valid, you can ignore errors.
        // But you might probably prefer sending yourself a log, to be aware if your dynamic variables get refused, especially if validation criteria change in the future.
    }
}
