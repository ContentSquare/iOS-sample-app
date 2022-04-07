import UIKit
import ContentsquareModule

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
// Add some items to the cart, then validate it to send the transaction
class TransactionsViewController: UIViewController {

    private var cart = [Item]()
    private var selectedCurrency : Currency = .eur
    private var itemCount = 0
    private var transactionCount = 0

    // MARK: - Buttons actions

    @IBAction private func addItemToCart(_ sender: UIButton)
    {
        let itemTitle = "item \(itemCount)"
        let itemPrice = Float(10)
        let newItem = Item(title: itemTitle, price: itemPrice, currency: selectedCurrency)
        cart.append(newItem)
        itemCount += 1
    }

    @IBAction private func validateCart(_ sender: UIButton)
    {
        // As a transaction represents a purchase made by a customer, you don't send the transaction as soon as the user adds an item to the cart
        // Wait for the user to validate the purchase
        var transactionValue: Float = 0
        cart.forEach { item in
            transactionValue += item.price
        }
        Contentsquare.send(transaction: CustomerTransaction(id: "Transaction\(transactionCount)", value: transactionValue, currency: selectedCurrency))
        transactionCount += 1

        cart.removeAll()
        itemCount = 0
    }
}

