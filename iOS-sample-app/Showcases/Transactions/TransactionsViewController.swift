import UIKit
import ContentSquare

struct Item
{
    private(set) var title: String
    private(set) var price: Float
    private(set) var currency: Currency

    init(title: String, price: Float, currency: Currency)
    {
        self.title = title
        self.price = price
        self.currency = currency
    }
}

// This class showcases how to track purchases made by an user with CustomerTransactions
// Add some items to the cart, then validate it to send the transactions
class TransactionsViewController: UIViewController {

    private var cart = [Item]()
    private var selectedCurrency : Currency = .eur
    private var itemCount = 0

    override func loadView()
    {
        super.loadView()

        let validateButton = UIButton(type: .system)
        validateButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(validateButton)
        validateButton.setTitle("Validate Cart", for: .normal)
        validateButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        validateButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        validateButton.addTarget(self, action: #selector(validateCart), for: .touchUpInside)

        let addItemButton = UIButton(type: .system)
        addItemButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(addItemButton)
        addItemButton.setTitle("Add an item to Cart", for: .normal)
        addItemButton.bottomAnchor.constraint(equalTo: validateButton.topAnchor, constant: -50).isActive = true
        addItemButton.centerXAnchor.constraint(equalTo: validateButton.centerXAnchor).isActive = true
        addItemButton.addTarget(self, action: #selector(addItemToCart), for: .touchUpInside)
    }

    // MARK: - Buttons actions

    @objc
    private func addItemToCart()
    {
        let itemTitle = "item \(itemCount)"
        let itemPrice = Float(itemCount)
        let newItem = Item(title: itemTitle, price: itemPrice, currency: selectedCurrency)
        cart.append(newItem)
        itemCount += 1
    }

    @objc
    private func validateCart()
    {
        // As a transaction represents a purchase made by a customer, you don't send the transaction as soon as the user adds an item to the cart
        // Wait for the user to validate the purchase
        for item in cart
        {
            ContentSquare.send(transaction: CustomerTransaction(id: item.title, value: item.price, currency: item.currency))
        }
        cart.removeAll()
        itemCount = 0
    }
}

