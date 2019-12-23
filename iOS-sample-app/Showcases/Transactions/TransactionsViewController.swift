import UIKit
import ContentSquare

struct MyItem
{
    private(set) var myTitle: String
    private(set) var myPrice: Float
    private(set) var myCurrency: Currency

    init(title: String, price: Float, currency: Currency)
    {
        myTitle = title
        myPrice = price
        myCurrency = currency
    }
}

// This class showcases how to track purchases made by an user with CustomerTransactions
class TransactionsViewController: UIViewController {

    private var itemsInCart = [MyItem]()
    private var selectedCurrency : Currency = .eur
    private var itemCount = 0

    override func loadView()
    {
        super.loadView()

        let validateButton = UIButton(type: .custom)
        validateButton.translatesAutoresizingMaskIntoConstraints = false
        validateButton.backgroundColor = .cyan
        self.view.addSubview(validateButton)
        validateButton.setTitle("Validate Cart", for: .normal)
        validateButton.setTitleColor(.black, for: .normal)
        validateButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        validateButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        validateButton.addTarget(self, action: #selector(validateCart), for: .touchUpInside)

        let addItemButton = UIButton(type: .custom)
        addItemButton.translatesAutoresizingMaskIntoConstraints = false
        addItemButton.backgroundColor = .lightGray
        self.view.addSubview(addItemButton)
        addItemButton.setTitle("Add an item to Cart", for: .normal)
        addItemButton.setTitleColor(.black, for: .normal)
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
        let newItem = MyItem(title: itemTitle, price: itemPrice, currency: selectedCurrency)
        itemsInCart.append(newItem)
        itemCount += 1
    }

    @objc
    private func validateCart()
    {
        for item in itemsInCart
        {
            ContentSquare.send(transaction: CustomerTransaction(id: item.myTitle, value: item.myPrice, currency: item.myCurrency))
        }
        itemsInCart.removeAll()
        itemCount = 0
    }
}

