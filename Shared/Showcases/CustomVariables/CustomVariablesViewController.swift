import UIKit
import ContentsquareModule

enum BannerType: String {
    case carousel
    case horizontalList
}

class CustomVariablesViewController: UIViewController {
    private var bannerType: BannerType = .carousel
    private var userLogged = true
    
    override func loadView() {
        super.loadView()

        sendCustomVariables()
    }

    //MARK: - Custom vars

    private func sendCustomVariables() {
        // What is the current banner display mode
        let bannerTypeCustomVar = CustomVar(index: 1,
                                            name: "banner_type",
                                            value: bannerType.rawValue)
        // Is the user logged in?
        let loggingCustomVar = CustomVar(index: 5,
                                         name: "user_login_status",
                                         value: userLogged ? "logged_in" : "logged_out")
        Contentsquare.send(screenViewWithName: "CustomVariablesScreen",
                           cvars: [bannerTypeCustomVar, loggingCustomVar])
    }
}
