import UIKit
import ContentSquare

// This class showcases how to gather addtional informations about the session,
// for instance A/B testing informations, or relevant informations about the user
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
        self.sendStringDynamicVariable(key: "Button Color", value: currentButtonColor.rgbaString)
        // Send some information about the user
        self.sendIntDynamicVariable(key: "User age", value: userAge)
    }

    private func sendStringDynamicVariable(key: String, value: String)
    {
        guard let dynamic = try? DynamicVar(key: key, value: value) else {return}
        ContentSquare.send(dynamicVar: dynamic)
    }

    private func sendIntDynamicVariable(key: String, value: Int)
    {
        guard let dynamic = try? DynamicVar(key: key, value: value) else {return}
        ContentSquare.send(dynamicVar: dynamic)
    }
}

extension UIColor {

    var rgbaString: String
    {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return "\(r)\(g)\(b)\(a)"
    }
}
