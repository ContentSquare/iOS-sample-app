import UIKit
import ContentSquare

// This class showcases how to use dynamic variables to gather additional data about the session,
// such as which version of an A/B test the user saw, or other relevant user data
class DynamicVariablesViewController: UIViewController {

    private let buyButton: UIButton = UIButton(type: .custom)
    private var currentButtonColor: UIColor = .yellow
    private var userAge: Int = 0

    override func loadView()
    {
        super.loadView()

        let colorSwitch = UISwitch()
        colorSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(colorSwitch)
        colorSwitch.addTarget(self, action: #selector(colorSwitchUpdated), for: .primaryActionTriggered)
        colorSwitch.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120).isActive = true
        colorSwitch.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50).isActive = true

        buyButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(buyButton)
        buyButton.backgroundColor = currentButtonColor
        buyButton.setTitleColor(.black, for: .normal)
        buyButton.setTitle("Buy Something!", for: .normal)
        buyButton.topAnchor.constraint(equalTo: colorSwitch.topAnchor).isActive = true
        buyButton.leftAnchor.constraint(equalTo: colorSwitch.rightAnchor, constant: 50).isActive = true

        // Retrieve the user age, from his personal account for instance
        userAge = 24

        self.updateDynamicVariables()
    }

    // MARK: - UI Actions

    @objc
    private func colorSwitchUpdated(sender: UISwitch)
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
