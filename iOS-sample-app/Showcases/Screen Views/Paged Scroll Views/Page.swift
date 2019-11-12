
import UIKit

class Page: UIView {
    static func instanceFromNib(index: Int) -> Page {
        let page = Bundle.main.loadNibNamed("Page", owner: self, options: nil)?.first as! Page
        page.index = index
        return page
    }
    
    @IBOutlet weak var pageNumberLabel: UILabel!

    var index = 1 {
        didSet {
            pageNumberLabel.text = String(index)
        }
    }
}
