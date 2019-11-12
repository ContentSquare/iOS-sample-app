
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

    private let scrollView = UIScrollView()
    private let pages = [makePage(number: 1), makePage(number: 2), makePage(number: 3)]

    private var currentPage: Int {
        let pageWidth = scrollView.frame.size.width
        let offset = scrollView.contentOffset.x
        return Int(round(offset / pageWidth) + 1)
    }
    private var previousPage: Int = 1
    
    private var pageName: String {
        return "Scroll page \(currentPage)"
    }

    override func loadView() {
        super.loadView()
        
        scrollView.frame.origin = CGPoint.zero
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        view.addSubview(scrollView)
        
        for page in pages {
            scrollView.addSubview(page)
        }
        
        layout(withSize: view.frame.size)
    }
    
    func layout(withSize size: CGSize) {
        scrollView.frame.size = size
        scrollView.contentSize =
            CGSize( width: scrollView.frame.width * CGFloat(pages.count), height: scrollView.frame.height)
        
        for i in 0 ..< pages.count {
            pages[i].frame = CGRect(
                origin: CGPoint(x: CGFloat(i) * scrollView.frame.width, y: scrollView.frame.origin.y),
                size: scrollView.frame.size
            )
        }
    }

    // Send a screen view when the view appears.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        trackScreenview(pageName)
    }

    // Send screen views on page change. In general, using scrollViewDidEndDecelerating is the way we recommend to
    // trigger screen views on page change.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // The scrollViewDidEndDecelerating method might be triggered even if you don't change pages. For instance, if
        // you try to scroll past the last page. This is why you should check if the previous page is not the same as
        // the current one to avoid retriggering screen views.
        if currentPage != previousPage {
            trackScreenview(pageName)
            previousPage = currentPage
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // React to device rotation etc.
        layout(withSize: size)
    }
}
