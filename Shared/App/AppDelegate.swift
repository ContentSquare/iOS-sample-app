
import UIKit
import ContentsquareModule
import ContentsquareErrorAnalysisModule

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Contentsquare.logLevel = .info
        ErrorAnalysis.setURLMaskingPatterns([
            "https://httpstatus-dev.eu-west-1.csq.fr/:status_code/person/:person_id/store/:store_id"
        ])
        return true
    }
}

