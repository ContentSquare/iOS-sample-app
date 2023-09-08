
import UIKit

// This class showcases how to track screen views for each page of a paged scroll view. There are many ways to do such
// views so your implementation might differ. The key aspects should be the same:
// - Trigger a screen view when the scroll view is displayed
// - Trigger a screen view every time the page changes
class PagedScrollViewController: UIViewController, UIScrollViewDelegate {

    private let scrollView = UIScrollView()
    private let pages = [1, 2, 3].map { Page.instanceFromNib(index: $0) }

    private var currentPageIndex: Int {
        let pageWidth = scrollView.frame.size.width
        let offset = scrollView.contentOffset.x
        return Int(round(offset / (pageWidth + 1)))
    }
    private var lastPageIndex: Int = 0
    
    private var pageName: String { "Scroll page \(pages[currentPageIndex].index)" }

    override func loadView() {
        super.loadView()

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        view.addSubview(scrollView)
        
        var currentLeadingAnchor = scrollView.contentLayoutGuide.leadingAnchor
        let pageConstraints = pages.flatMap { page in
            page.backgroundColor = .randomPastelColor
            page.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(page)
            defer {
                currentLeadingAnchor = page.trailingAnchor
            }
            return [
                page.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
                page.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
                page.leadingAnchor.constraint(equalTo: currentLeadingAnchor),
                page.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                page.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            ]
        }

        NSLayoutConstraint.activate(pageConstraints + [
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pages.last!.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
        ])
    }
    
    // Send a screen view when the view appears.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        trackScreenview(pageName)
    }

    // Send screen views on page change. Using scrollViewDidEndDecelerating is the way we recommend to trigger screen
    // views on page change.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // The scrollViewDidEndDecelerating method might be triggered even if you don't change pages. For instance, if
        // you try to scroll past the last page. This is why you should check if the previous page is not the same as
        // the current one to avoid retriggering screen views.
        let currentPageIndex = currentPageIndex
        if currentPageIndex != lastPageIndex {
            trackScreenview(pageName)
            lastPageIndex = currentPageIndex
        }
    }
}

final class Page: UIView {

    static func instanceFromNib(index: Int) -> Page {
        let page = Bundle.main.loadNibNamed("Page", owner: self, options: nil)?.first as! Page
        page.index = index
        return page
    }
    
    @IBOutlet private weak var pageNumberLabel: UILabel!

    var index = 1 {
        didSet {
            pageNumberLabel.text = String(index)
        }
    }
}

private extension UIColor {

    static var randomPastelColor: UIColor {
        UIColor(hue: CGFloat.random(in: 0..<1), saturation: 0.1, brightness: 0.9, alpha: 1)
    }
}
