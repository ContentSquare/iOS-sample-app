
import UIKit

class Page: UIView {
    @IBOutlet weak var pageNumberLabel: UILabel!

    var pageNumber = 1 {
        didSet {
            pageNumberLabel.text = String(pageNumber)
        }
    }
}
