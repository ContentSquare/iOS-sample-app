
import UIKit
import ContentSquare

// This class showcases how to track screen views for each page of a paged scroll view. There are many ways to do such
// views so your implementation might differ. The key aspects should be the same:
// - Trigger a screen view when the scroll view is displayed
// - Trigger a screen view every time the page changes
class PagedScrollViewController: UIViewController, UIScrollViewDelegate {
    private static func makePage(number: Int) -> UIView {
        let page = Bundle.main.loadNibNamed("Page", owner: self, options: nil)?.first as! Page
        page.pageNumber = number
        return page
    }

    @IBOutlet weak var scrollView: UIScrollView!

    private let page1 = makePage(number: 1)
    private let page2 = makePage(number: 2)
    private let page3 = makePage(number: 3)

    private var currentPage: Int {
        let pageWidth = scrollView.frame.size.width
        let offset = scrollView.contentOffset.x
        return Int(round(offset / pageWidth) + 1)
    }
    private var previousPage: Int = 1
    
    private var screenName: String {
        return "Scroll page \(currentPage)"
    }

    override func viewDidLoad() {
        scrollView.addSubview(page1)
        scrollView.addSubview(page2)
        scrollView.addSubview(page3)

        let views: [String: UIView] = ["scrollview": scrollView, "page1": page1, "page2": page2, "page3": page3]
        let verticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|[page1(==scrollview)]|",
            options: [],
            metrics: nil,
            views: views)
        let horizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|[page1(==scrollview)][page2(==scrollview)][page3(==scrollview)]|",
            options: [.alignAllTop, .alignAllBottom],
            metrics: nil,
            views: views)
        NSLayoutConstraint.activate(verticalConstraints + horizontalConstraints)
    }

    // Send a screen view when the view appears.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        trackScreenview(screenName)
    }

    // Send screen views on page change. In general, using scrollViewDidEndDecelerating is the way we recommend to
    // trigger screen views on page change.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // The scrollViewDidEndDecelerating method might be triggered even if you don't change pages. For instance, if
        // you try to scroll past the last page. This is why you should check if the previous page is not the same as
        // the current one to avoid retriggering screen views.
        if currentPage != previousPage {
            trackScreenview(screenName)
            previousPage = currentPage
        }
    }
}
